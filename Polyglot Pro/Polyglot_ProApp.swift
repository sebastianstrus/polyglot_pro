//
//  Polyglot_ProApp.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

@main
struct Polyglot_ProApp: App {
    init() {
        Task {
            NSApp.appearance = NSAppearance(named: .lightContent)
        }
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth:1200, maxWidth: .infinity, minHeight: 800, maxHeight: .infinity)
        }
    }
}

