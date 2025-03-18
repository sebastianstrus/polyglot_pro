//
//  Platform.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-16.
//

import SwiftUI

enum Platform {
    case macOS, iOS, iPadOS, unknown
    
    static var current: Platform {
#if os(macOS)
        return .macOS
#elseif os(iOS)
        return UIDevice.current.userInterfaceIdiom == .pad ? .iPadOS : .iOS
#else
        return .unknown
#endif
    }
}
