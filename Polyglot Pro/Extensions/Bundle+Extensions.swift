//
//  Bundle+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-02.
//

import SwiftUI

#if os(iOS)
import UIKit
import MessageUI
#endif

extension Bundle {
    var appVersion: String {
        "\(infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0") (\(infoDictionary?["CFBundleVersion"] as? String ?? "1"))"
    }
}
