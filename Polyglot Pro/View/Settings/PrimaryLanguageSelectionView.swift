//
//  PrimaryLanguageSelectionView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-05.
//

import SwiftUI

struct PrimaryLanguageSelectionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var settings: SettingsManager
    @Binding var selectedLanguage: Language?
    
    @State var tempLanguage: Language?
    @State var showAlert: Bool = false
    
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
                //selectedLanguage = language
                showAlert = true
                tempLanguage = language
            }
        }
        .customTitle("Language".localized)
        .confirmationDialog("Do you want to Switch language to \(tempLanguage?.displayName ?? "othe language")?", isPresented: $showAlert, titleVisibility: .visible) {
            Button("Ok") {
                selectedLanguage = tempLanguage
                dismiss()
                dismiss()

            }
            
            Button("Cancel", role: .cancel) {
                
            }
        }
    }
}
