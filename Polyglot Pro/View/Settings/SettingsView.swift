//
//  SettingsView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

#if os(iOS)
import MessageUI
#endif

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsManager
    @Environment(\.layoutDirection) var layoutDirection
        
    @State private var showProgressAlert = false
    @State private var showCacheAlert = false
    @State private var showMailComposer = false
    @State private var showingLanguageHelp = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            List {
                Section(header: Text("Language".localized)) {
                    NavigationLink(destination: EmptyView()) {
                            HStack {
                                Text("App Language".localized)
                                Spacer()
                                Text(settings.primaryLanguage.displayName)
#if os(macOS)
                                Image(systemName: "chevron.right")
                                    .scaleEffect(x: layoutDirection == .rightToLeft ? -1 : 1, y: 1)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(Color(NSColor.tertiaryLabelColor))
#endif
                            }
                            .contentShape(Rectangle()) // makes entire row tappable
                            .onTapGesture {
                                
#if os(macOS)
                                showingLanguageHelp = true
#else
                                settings.openAppLanguageSettings()
#endif
                            }
                        }
                    
                    NavigationLink(destination: TargetLanguageSelectionView(selectedLanguage: $settings.targetLanguage)) {
                        HStack {
                            Text("Target Language".localized)
                            Spacer()
                            Text(settings.targetLanguage!.displayName)
#if os(macOS)
                                Image(systemName: "chevron.right")
                                    .scaleEffect(x: layoutDirection == .rightToLeft ? -1 : 1, y: 1)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(Color(NSColor.tertiaryLabelColor))
#endif
                            
                        }
                    }
                }
#if os(macOS)
                .alert("Change App Language", isPresented: $showingLanguageHelp) {
                    Button("Open System Settings") {
                        settings.openAppLanguageSettings()
                    }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("To change the language of this app, go to System Settings → General → Language & Region → Applications, then add or select Polyglot Pro application.")
                }
#endif
                
                Section(header: Text("Vocabulary Settings".localized)) {
                    Toggle("Count Hints".localized, isOn: settings.$isCountingMistakes)
                        .tint(.purple)
                    Toggle("Display Confetti".localized, isOn: settings.$isConfettiOn)
                        .tint(.purple)
                    Button("Reset Progress".localized) {
                        showProgressAlert = true
                    }.tint(LinearGradient(colors: [.blue, .blue, .purple], startPoint: .leading, endPoint: .trailing))
                }
                
                Section(header: Text("Appearance".localized)) {
                    Picker("Theme".localized, selection: Binding(
                        get: { settings.isDarkMode ? 1 : 0 },
                        set: { settings.isDarkMode = $0 == 1 }
                    )) {
                        Text("Light".localized).tag(0)
                        Text("Dark".localized).tag(1)
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Sound Settings".localized)) {
                    Toggle("Auto-play Pronunciation".localized, isOn: settings.$isSoundOn)
                        .tint(.purple)
                    
                    HStack {
                        Text("Speech Speed".localized)
                            .padding(.trailing, 10)
                        
                        GradientSlider(value: settings.$speechRate, range: 0.1...0.6, step: 0.1)
                    }
                }
                
                Section(header: Text("Let Us Know What You Think".localized)) {
                    Button("Share Feedback".localized) {
#if os(macOS)
                        shareFeedback()
#else
                        showMailComposer = true
#endif
                    }.tint(LinearGradient(colors: [.blue, .blue, .purple], startPoint: .leading, endPoint: .trailing))
                }
                
                Section(header: Text("Default Settings".localized)) {
                    Button("Reset Settings".localized) {
                        settings.resetSettings()
                    }
                }
                .tint(LinearGradient(colors: [.blue, .blue, .purple], startPoint: .leading, endPoint: .trailing))
                
                Section(header: Text("Application Cache".localized)) {
                    Button("Reset & Exit".localized) {
                        showCacheAlert = true
                    }
                    .foregroundColor(.red)
                }
            }
        }
        .background( GradientBackground().ignoresSafeArea().opacity(settings.isDarkMode ? 1.0 : 0.0))
        .scrollContentBackground(settings.isDarkMode ? .hidden : .visible)
        .alert("Are you sure you want to reset your progress?".localized, isPresented: $showProgressAlert) {
            Button("Delete".localized, role: .destructive) {
                settings.resetCompletedCategories()
            }
            Button("Cancel".localized, role: .cancel) { }
        } message: {
            Text("This action cannot be undone.".localized)
        }
        .alert("Are you sure you want to delete the application cache and close the app?".localized, isPresented: $showCacheAlert) {
            Button("Delete".localized, role: .destructive) {
                settings.clearUserDefaultsAndCloseApp()
            }
            Button("Cancel".localized, role: .cancel) { }
        } message: {
            Text("This action cannot be undone.".localized)
        }
#if os(iOS)
        .sheet(isPresented: $showMailComposer) {
            if MFMailComposeViewController.canSendMail() {
                MailComposer(
                    isPresented: $showMailComposer,
                    screenshot: nil,
                    recipient: "feedback@polyglotpro.com",
                    subject: "Polyglot Pro Feedback"
                )
            } else {
                Text("Please configure Mail to send feedback.".localized)
            }
        }
#endif
        .customTitle("Settings".localized)
        .toolbar {
                    ToolbarItem(placement: .primaryAction) { // Top-right corner
                        Button(action: shareApp) {
                            Image(systemName: "square.and.arrow.up")
                                .accessibilityLabel("Share".localized)
                        }.tint(.purple)
                    }
                }
    }
    
    private func shareApp() {
        let text = "Check out Polyglot Pro - a great language learning app!".localized
        let url = URL(string: "TODO_Use_App_Store_link")!
        //let url = URL(string: "https://apps.apple.com/app/YOUR_APP_ID")!
        
#if os(iOS)
        let activityViewController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
        
        // Present the share sheet
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityViewController, animated: true, completion: nil)
        }
#elseif os(macOS)
        let picker = NSSharingServicePicker(items: [text, url])
        if let window = NSApp.keyWindow {
            picker.show(relativeTo: .zero, of: window.contentView!, preferredEdge: .minY)
        }
#endif
    }
    
#if os(macOS)
    func shareFeedback() {
        let recipient = "feedback@polyglotpro.com"
        let subject = "Polyglot Pro Feedback"
        let body = "I would like to share my feedback on the Polyglot Pro app:".localized + "\n\n"
        
        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        if let url = URL(string: "mailto:\(recipient)?subject=\(encodedSubject)&body=\(encodedBody)") {
            if NSWorkspace.shared.open(url) {
                // Opens the default email client with the subject, body, and recipient pre-filled
            } else {
                // Handle case when mail client is not available
                print("No email client found")
            }
        }
    }
#endif
}


import SwiftUI

struct PrimaryLanguageSelectionView: View {
    
    @EnvironmentObject var settings: SettingsManager
    @Binding var selectedLanguage: Language?
    
    var body: some View {
        List(Language.allCases.filter { $0 != settings.targetLanguage }, id: \.self) { language in
            HStack {
                Text(language.displayName)
                Spacer()
                if language == selectedLanguage {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle()) // Makes the whole row tappable
            .onTapGesture {
                selectedLanguage = language
            }
        }
        .customTitle("Language".localized)
    }
}

struct TargetLanguageSelectionView: View {
    @Binding var selectedLanguage: Language?
    
    var body: some View {
        List(Language.allCases, id: \.self) { language in
            
            HStack {
                Text(language.flag)
                    .font(.system(size: 34))
                
                VStack(alignment: .leading) {
                    Text(language.nativeName)
                        .font(.body)
                    Text(language.displayName)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                if language == selectedLanguage {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle()) // Makes the whole row tappable
            .onTapGesture {
                selectedLanguage = language
            }
        }
        .customTitle("Select Language".localized)
    }
}

