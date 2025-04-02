//
//  Bundle+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-02.
//

import SwiftUI
import UIKit
import MessageUI

extension Bundle {
    var appVersion: String {
        "\(infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0") (\(infoDictionary?["CFBundleVersion"] as? String ?? "1"))"
    }
}
