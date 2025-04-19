//
//  MainView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-24.
//

import SwiftUI

#if os(iOS)
import MessageUI
#endif

struct MainView: View {
    @EnvironmentObject var settings: SettingsManager
    @State private var showMailComposer = false
    @State private var selectedTab: Tab = .vocabulary
    
    enum Tab: Hashable {
        case alphabet
        case vocabulary
        case grammar
        case exercises
        case settings
    }
    
#if os(iOS)
    @State private var screenshot: UIImage?
    @State private var isPreparingScreenshot = false
#endif
    
    var body: some View {
        ZStack {
            if settings.targetLanguage == nil {
                SelectLanguageView()
            } else {
                TabView(selection: $selectedTab) {
                    // 2. Vocabulary Tab
                    NavigationStack {
                        VocabularyView()
                    }
                    .accentColor(.blue)
                    .tabItem {
                        Label("Vocabulary".localized, systemImage: "text.book.closed")
                    }
                    .tag(Tab.vocabulary)
                    
                    // 1. Alphabet Tab
                    NavigationStack {
                        AlphabetView(viewModel: AlphabetViewModel(settings: settings))
                    }
                    .accentColor(.blue)
                    .tabItem {
                        Label("Alphabet".localized, systemImage: "textformat.abc")
                    }
                    .tag(Tab.alphabet)
                    
                    
                    
                    // 3. Grammar Tab
                    NavigationStack {
                        GrammarView()
                    }
                    .accentColor(.blue)
                    .tabItem {
                        Label("Grammar".localized, systemImage: "list.bullet.rectangle")
                    }
                    .tag(Tab.grammar)
                    
                    // 4. Exercises Tab
                    NavigationStack {
                        ExercisesView()
                    }
                    .accentColor(.blue)
                    .tabItem {
                        Label("Exercises".localized, systemImage: "pencil.and.list.clipboard")
                    }
                    .tag(Tab.exercises)
                    
                    // 5. Settings Tab
                    NavigationStack {
                        SettingsView()
                            .navigationDestination(for: Destination.self) { destination in
                                handleDestination(destination)
                            }
                    }
                    .accentColor(.blue)
                    .tabItem {
                        Label("Settings".localized, systemImage: "gearshape")
                    }
                    .tag(Tab.settings)
                }
                .accentColor(.purple)
                #if os(macOS)
                .safeAreaInset(edge: .top) { Color.clear.frame(height: 28) }
                #endif
                .background(
                    GradientBackground()
                        .ignoresSafeArea()
                )
            }
            
#if os(iOS)
            if isPreparingScreenshot {
                ProgressView("Preparing screenshot...")
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .opacity(0)
            }
#endif
        }
#if os(iOS)
        .onShake {
            captureScreenshot()
        }
        .sheet(isPresented: $showMailComposer) {
            if MFMailComposeViewController.canSendMail() {
                MailComposer(
                    isPresented: $showMailComposer,
                    screenshot: screenshot,
                    recipient: "feedback@polyglotpro.com",
                    subject: "Polyglot Pro Feedback"
                )
            } else {
                Text("Please configure Mail to send feedback.")
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            print("TEST100 didBecomeActiveNotification")
            settings.updateLanguage()
        }
#endif
    }
    
    private func handleDestination(_ destination: Destination) -> some View {
        Group {
               switch destination {
               case .selectLanguage:
                   SelectLanguageView()
               case .quiz(let category):
                   QuizView(viewModel: LearnViewModel(settings: settings, category: category))
               }
           }
    }
    
#if os(iOS)
    private func captureScreenshot() {
        guard !isPreparingScreenshot else { return }
        
        isPreparingScreenshot = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            guard let window = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows
                .first(where: { $0.isKeyWindow }) else {
                isPreparingScreenshot = false
                return
            }
            
            window.layoutIfNeeded()
            let renderer = UIGraphicsImageRenderer(size: window.bounds.size)
            screenshot = renderer.image { _ in
                window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
            }
            
            isPreparingScreenshot = false
            showMailComposer = true
        }
    }
#endif
}
