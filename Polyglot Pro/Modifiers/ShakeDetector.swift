//
//  ShakeDetector.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-02.
//

import SwiftUI

struct ShakeDetector: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}
