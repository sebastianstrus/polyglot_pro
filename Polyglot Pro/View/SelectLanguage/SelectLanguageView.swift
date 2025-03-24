//
//  SelectLanguageView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct SelectLanguageView: View {
    @ObservedObject private var settings = SettingsManager.shared
    
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
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Select primary language:")
                .font(.system(size: size, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
            
            
            
            Picker("", selection: $settings.primaryLanguage) {
                ForEach(Language.allCases) { language in
                    Text(language.displayName)
                        .tag(language)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 200)
            .padding(.bottom)
            
            
            Text("Selected target language:")
                .font(.system(size: size, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
            
            Picker("", selection: $settings.targetLanguage) {
                ForEach([Language.swedish]) { language in
                    Text(language.displayName)
                        .tag(language)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 200)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(value: Destination.main) {
                Text("Continue")
                    .styledButton(.secondary)
            }.buttonStyle(ScaleButtonStyle())
            
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
        
        
//        .background(
//            GradientBackground()
//                .ignoresSafeArea()
//        )
    }
}
