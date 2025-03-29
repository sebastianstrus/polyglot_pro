//
//  GradientView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-19.
//

import SwiftUI

struct GradientBackground: View {
    
    @EnvironmentObject var settings: SettingsManager
    
    var body: some View {
        
        let lightColors: [Color] = [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]
        let darkColors: [Color] = [Color.black.opacity(0.7), Color.black.opacity(0.9)]
        LinearGradient(
            gradient: Gradient(colors: settings.isDarkMode ? darkColors : lightColors),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
