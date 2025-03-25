//
//  SettingsView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsManager
    
    var body: some View {
        VStack {
            
            Spacer()
            
            List {
                Section(header: Text("Speech")) {
                    Toggle("Auto-read expressions", isOn: settings.$isSoundOn)
                        .tint(.purple)
                    
                    HStack {
                        Text("Speech rate")
                            .padding(.trailing, 10)
                        Slider(value: settings.$speechRate, in: 0.1...0.6, step: 0.1)
                            .tint(.purple)
                    }
                }
                
                Section(header: Text("Language")) {
                    NavigationLink(destination: PrimaryLanguageSelectionView(selectedLanguage: Binding(
                        get: { settings.primaryLanguage ?? Language.english },
                        set: { newValue in settings.savePrimaryLanguage(newValue) }
                    ))) {
                        HStack {
                            Text("Primary language")
                            Spacer()
                            Text(settings.primaryLanguage!.displayName)
                            
                        }
                    }
                    
                    NavigationLink(destination: TargetLanguageSelectionView(selectedLanguage: $settings.targetLanguage)) {
                        HStack {
                            Text("Target language")
                            Spacer()
                            Text(settings.targetLanguage.displayName)
                        }
                    }
                }
                
                Section {
                    Button("Reset Settings") {
                        settings.isSoundOn = true
                        settings.primaryLanguage = .english
                        settings.targetLanguage = .swedish
                        settings.speechRate = 0.4
                        
                    }
                    .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Settings")
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
        .navigationTitle("Choose Language")
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
        .navigationTitle("Choose Language")
    }
}
