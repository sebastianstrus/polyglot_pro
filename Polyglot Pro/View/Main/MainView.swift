//
//  MainView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-24.
//

import SwiftUI

enum Destination: Hashable {
    case alphabet
    case vocabulary
    case grammar
    case exercises
    case quiz(Category)
    case settings
    case main
    case selectLanguage
}

struct MainView: View {
    
    @EnvironmentObject var settings: SettingsManager
    
    
    let size: CGFloat = {
        switch Platform.current {
        case .macOS: return 60.0
        default: return 46
        }
    }()
    
    let paddingTop: CGFloat = {
        switch Platform.current {
        case .macOS: return 20
        default: return 20
        }
    }()
    
    let spacing: CGFloat = {
        switch Platform.current {
        case .macOS: return 36
        default: return 14
        }
    }()
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: spacing) {
                    
                    Text("Polyglot Pro")
                        .font(.system(size: size, weight: .bold, design: .rounded))
                        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                        .padding(.top, paddingTop)
                    
                    
                    Spacer()
                    
                    NavigationLink(value: Destination.alphabet) {
                        Text("Alphabet".localized).styledButton(.secondary)
                    }.buttonStyle(ScaleButtonStyle())
                    
                    NavigationLink(value: Destination.vocabulary) {
                        Text("Vocabulary".localized).styledButton(.secondary)
                    }.buttonStyle(ScaleButtonStyle())
                    
                    NavigationLink(value: Destination.grammar) {
                        Text("Grammar".localized).styledButton(.secondary)
                    }.buttonStyle(ScaleButtonStyle())
                    
                    NavigationLink(value: Destination.exercises) {
                        Text("Exercises".localized).styledButton(.secondary)
                    }.buttonStyle(ScaleButtonStyle())
                    
                    NavigationLink(value: Destination.settings) {
                        Text("Settings".localized).styledButton(.secondary)
                    }.buttonStyle(ScaleButtonStyle())
                    
                    
                    Spacer()
                    Spacer()
                }
                .customTitle("Menu".localized)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                    case .alphabet: AlphabetView(viewModel: AlphabetViewModel(settings: settings))
                    case .grammar: GrammarView()
                    case .vocabulary: VocabularyView()
                    case .exercises: ExercisesView()
                    case .settings: SettingsView()
                    case .selectLanguage: SelectLanguageView()
                    case .quiz(let category): QuizView(viewModel: LearnViewModel(settings: settings, category: category))
                    case .main: MainView()
                    }
                }
#if os(macOS)
                .safeAreaInset(edge: .top) { Color.clear.frame(height: 28) }
#endif
                .safeAreaInset(edge: .top) { Color.clear.frame(height: 28) }
                
                .background(
                    GradientBackground()
                        .ignoresSafeArea()
                )
#if os(iOS)
                .navigationBarHidden(true)
#endif
            }
            
            if settings.primaryLanguage == nil {
                SelectLanguageView()
            }
        }
    }
}

