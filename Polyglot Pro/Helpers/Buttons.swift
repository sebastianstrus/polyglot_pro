//
//  PolyButton.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-15.
//
/*
import SwiftUI

struct PlatformButtonStyle: ButtonStyle {
    
    @EnvironmentObject var settings: SettingsManager
    
    func makeBody(configuration: Configuration) -> some View {
        #if os(iOS)
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        #elseif os(macOS)
        configuration.label
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(6)
        #endif
    }
}


NavigationLink(value: Destination.alphabet) {
    Text("Alphabet".localized).styledButton(.secondary)
}.buttonStyle(ScaleButtonStyle())

struct PolyButton: View {
        
    var body: some View {
        
        let lightColors: [Color] = [Color.cyan.opacity(0.05), Color.blue.opacity(0.1)]
        let darkColors: [Color] = [Color(red: 5/255, green: 10/255, blue: 13/255), Color(red: 15/255, green: 6/255, blue: 20/255)]
        
        LinearGradient(
            gradient: Gradient(colors: settings.isDarkMode ? darkColors : lightColors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}


struct IconButton: View {
    var title: String
    var icon: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
*/
