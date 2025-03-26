//
//  GradientView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-19.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
