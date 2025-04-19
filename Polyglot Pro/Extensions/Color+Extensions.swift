//
//  Color+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-19.
//

import SwiftUI

extension Color {
    init(_ red: Int, _ green: Int, _ blue: Int, opacity: Int = 255) {
        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(opacity) / 255
        )
    }
}
