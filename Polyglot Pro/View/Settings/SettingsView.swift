//
//  SettingsView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsManager
        
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            List {
                Section(header: Text("Vocabulary Settings".localized)) {
                    Toggle("Count Hints".localized, isOn: settings.$isCountingMistakes)
                        .tint(.purple)
                    Toggle("Display Confetti".localized, isOn: settings.$isConfettiOn)
                        .tint(.purple)
                    Button("Reset Progress".localized) {
                        showAlert = true
                    }
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
                        Slider(value: settings.$speechRate, in: 0.1...0.6, step: 0.1)
                            .tint(.purple)
                    }
                }
                
                Section(header: Text("Language".localized)) {
                    NavigationLink(destination: PrimaryLanguageSelectionView(selectedLanguage: Binding(
                        get: { settings.primaryLanguage ?? Language.english },
                        set: { newValue in settings.savePrimaryLanguage(newValue) }
                    ))) {
                        HStack {
                            Text("App Language".localized)
                            Spacer()
                            Text(settings.primaryLanguage!.displayName)
                            
                        }
                    }
                    
                    NavigationLink(destination: TargetLanguageSelectionView(selectedLanguage: $settings.targetLanguage)) {
                        HStack {
                            Text("Target Language".localized)
                            Spacer()
                            Text(settings.targetLanguage.displayName)
                        }
                    }
                }
                
                Section {
                    Button("Reset Settings".localized) {
                        settings.isSoundOn = true
                        settings.primaryLanguage = .english
                        settings.targetLanguage = .swedish
                        settings.speechRate = 0.4
                        
                    }
                    .foregroundColor(.red)
                }
            }
        }
        .background( GradientBackground().ignoresSafeArea().opacity(settings.isDarkMode ? 1.0 : 0.0))
        .scrollContentBackground(settings.isDarkMode ? .hidden : .visible)
        .alert("Are you sure you want to reset your progress?".localized, isPresented: $showAlert) {
            Button("Delete".localized, role: .destructive) {
                        settings.resetCompletedCategories()
                    }
            Button("Cancel".localized, role: .cancel) { }
                } message: {
                    Text("This action cannot be undone.".localized)
                }
        .customTitle("Settings".localized)
    }
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
        .customTitle("Select language".localized)
    }
}

struct TargetLanguageSelectionView: View {
    @Binding var selectedLanguage: Language
    
    var body: some View {
        List([Language.swedish], id: \.self) { language in
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
        .customTitle("Choose language".localized)
    }
}
