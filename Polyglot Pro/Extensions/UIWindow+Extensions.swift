//
//  UIWindow+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-02.
//

import MessageUI

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}
