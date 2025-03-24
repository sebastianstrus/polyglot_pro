//
//  SettingsView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var settings = SettingsManager.shared
    
    var body: some View {
        VStack {
            
            Spacer()
            
            List {
                Section(header: Text("Speech")) {
                    Toggle("Speech", isOn: settings.$isSoundOn)
                        .tint(.purple)
                    
                    HStack {
                        Text("Speech rate")
                            .padding(.trailing, 10)
                        Slider(value: settings.$speechRate, in: 0.1...0.6, step: 0.1)
                            .tint(.purple)
                    }
                }
                
                Section(header: Text("Language")) {
                    Picker("Primary language", selection: Binding(
                        get: { settings.primaryLanguage ?? Language.english },
                        set: { newValue in settings.savePrimaryLanguage(newValue) }
                    )) {
                        Text("None").tag(nil as Language?) // Option to reset to nil
                        ForEach(Language.allCases, id: \.self) { language in
                            Text(language.displayName).tag(language as Language?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Picker("Target language", selection: $settings.targetLanguage) {
                        ForEach([Language.swedish], id: \.self) { language in
                            Text(language.displayName)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section {
                    Button("Reset Settings") {
                        settings.isSoundOn = true
                        settings.primaryLanguage = .english
                        settings.targetLanguage = .swedish
                        
                    }
                    .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Settings")
    }
}
