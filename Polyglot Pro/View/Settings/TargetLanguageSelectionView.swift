//
//  TargetLanguageSelectionView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-05.
//

import SwiftUI

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
