//
//  Text+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

extension Text {
    func styledText(color: Color) -> some View {
        self
            .font(.system(size: 22, weight: .bold, design: .rounded))
            .foregroundColor(color)
    }
}
