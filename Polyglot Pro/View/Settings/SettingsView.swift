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
        
    @State private var showProgressAlert = false
    @State private var showCacheAlert = false
    @State private var showMailComposer = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            List {
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
                
                Section(header: Text("Vocabulary Settings".localized)) {
                    Toggle("Count Hints".localized, isOn: settings.$isCountingMistakes)
                        .tint(.purple)
                    Toggle("Display Confetti".localized, isOn: settings.$isConfettiOn)
                        .tint(.purple)
                    Button("Reset Progress".localized) {
                        showProgressAlert = true
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
                
                Section(header: Text("Let Us Know What You Think".localized)) {
                    Button("Share Feedback".localized) {
#if os(macOS)
                        shareFeedback()
#else
                        showMailComposer = true
#endif
                    }
                }
                
                Section(header: Text("Default Settings".localized)) {
                    Button("Reset Settings".localized) {
                        settings.resetSettings()
                    }
                }
                
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
