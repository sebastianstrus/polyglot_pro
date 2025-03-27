//
//  NavigationTitleModifier.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-27.
//

import SwiftUI

struct NavigationTitleModifier: ViewModifier {
    let title: String
    
    func body(content: Content) -> some View {
        Group {
#if os(macOS)
            content.navigationTitle(title.localized)
            
#else
            content
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(title.localized)
                            .font(.headline)
                            .foregroundStyle(LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
#endif
        }
    }
}
