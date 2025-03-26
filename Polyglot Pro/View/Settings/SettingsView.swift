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
                Section(header: Text("Sound settings".localized)) {
                    Toggle("Auto-read expressions".localized, isOn: settings.$isSoundOn)
                        .tint(.purple)
                    
                    HStack {
                        Text("Speech rate".localized)
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
                            Text("Primary language".localized)
                            Spacer()
                            Text(settings.primaryLanguage!.displayName)
                            
                        }
                    }
                    
                    NavigationLink(destination: TargetLanguageSelectionView(selectedLanguage: $settings.targetLanguage)) {
                        HStack {
                            Text("Target language".localized)
                            Spacer()
                            Text(settings.targetLanguage.displayName)
                        }
                    }
                }
                
                Section {
                    Button("Reset settings".localized) {
                        settings.isSoundOn = true
                        settings.primaryLanguage = .english
                        settings.targetLanguage = .swedish
                        settings.speechRate = 0.4
                        
                    }
                    .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Settings".localized)
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
        .navigationTitle("Select language".localized)
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
        .navigationTitle("Choose language".localized)
    }
}
