//
//  SelectLanguageView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct SelectLanguageView: View {
    
    @EnvironmentObject var settings: SettingsManager
    
    @State private var tempPrimaryLanguage: Language?
    @State private var tempTargetLanguage: Language = .swedish // Default
    
    @State private var isSameLanguage: Bool = false
    
    
    let size: CGFloat = {
        switch Platform.current {
        case .macOS: return 20.0
        default: return 16
        }
    }()
    
    let width: CGFloat = {
        switch Platform.current {
        case .macOS: return 400
        default: return 300
        }
    }()
    
    let height: CGFloat = {
        switch Platform.current {
        case .macOS: return 470
        default: return 380
        }
    }()
    
    let lineWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 5
        default: return 3
        }
    }()
    
    let warningSize: CGFloat = {
        switch Platform.current {
        case .macOS: return 16
        default: return 12
        }
    }()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Select primary language:".localized)
                .font(.system(size: size, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
            
            Picker("", selection: $tempPrimaryLanguage) {
                ForEach(Language.allCases) { language in
                    Text(language.displayName)
                        .tag(language as Language?)
                }
            }
            .frame(width: 200)
            .padding(.bottom)
#if os(iOS)
            .pickerStyle(WheelPickerStyle())
#endif
            
            
            Text("Selected target language:".localized)
                .font(.system(size: size, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
            
            Picker("", selection: $tempTargetLanguage) {
                ForEach([Language.swedish]) { language in
                    Text(language.displayName)
                        .tag(language)
                }
            }
#if os(iOS)
            .pickerStyle(WheelPickerStyle())
#endif
            .frame(width: 200)
            .padding(.bottom)
            
            Spacer()
            
            Text("The languages must be different.".localized)
                .font(.system(size: warningSize))
                .foregroundColor(.red)
                .opacity(isSameLanguage ? 1 : 0)
            
            
            NavigationLink(value: Destination.main) {
                Text("Continue".localized)
                    .styledButton(.secondary)
                    
            }.buttonStyle(ScaleButtonStyle())
                .onTapGesture {
                    guard tempPrimaryLanguage != tempTargetLanguage else {
                        isSameLanguage = true
                        return
                    }
                    
                    settings.savePrimaryLanguage(tempPrimaryLanguage)
                    settings.targetLanguage = tempTargetLanguage
                }
            
            Spacer()
        }
        .padding()
        .frame(width: width, height: height, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: lineWidth)
                .shadow(color: .purple.opacity(0.5), radius: 20)
        )
    }
}
