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
        WindowGroup {
            VocabularyView()
                .frame(minWidth: minWidth, maxWidth: .infinity, minHeight: minHeight, maxHeight: .infinity)
                .preferredColorScheme(.light)
        }
    }
}

