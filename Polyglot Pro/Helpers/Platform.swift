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


//switch Platform.current {
//case .macOS:
//    print("Running on macOS")
//case .iPadOS:
//    print("Running on iPadOS")
//case .iOS:
//    print("Running on iOS")
//case .unknown:
//    print("Unknown platform")
//}
