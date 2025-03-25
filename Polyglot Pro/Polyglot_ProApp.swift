//
//  Polyglot_ProApp.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

@main
struct Polyglot_ProApp: App {
    
    let minWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 1350
        default: return 100
        }
    }()
    
    let minHeight: CGFloat = {
        switch Platform.current {
        case .macOS: return 800
        default: return 100
        }
    }()
    
    
    init() {
#if os(macOS)
        Task {
            NSApp.appearance = NSAppearance(named: .aqua)
        }
#endif
    }
    
    var body: some Scene {
        
        
        return WindowGroup {
            MainView()
                .environmentObject(SettingsManager.shared)
                .frame(minWidth: minWidth, maxWidth: .infinity, minHeight: minHeight, maxHeight: .infinity)
                .preferredColorScheme(.light)
            
            
        }
    }
}






/* upload: sv_adjectives_colors.json
Hej. Tworzę aplikację do nauki języka szwedzkiego dla osób, które już znają inne języki. Potrzebuję więcej wyrazen z tłumaczeniami. Do każdego wyrazenia 4 przykłady zdań, które też są przetłumaczone. Potrzebuję te wyrazenia w formacie json. Wysyłam Ci plik json z przykładową inną kategorią i proszę stwórz nowy plik z poniższymi wyrazeniami. Wykorzystaj koniecznie wszystkie poniżej. Użyj wszystkie słowa. Aż do końca.

nyligen, idag, i morse, i kväll, i natt, om en stund, hädanefter, hittills, då och då, någon gång
*/
