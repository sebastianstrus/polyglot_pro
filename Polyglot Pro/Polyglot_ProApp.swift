//
//  Polyglot_ProApp.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

@main
struct Polyglot_ProApp: App {
    
    @StateObject private var settings = SettingsManager.shared
    
    let minWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 1350
        default: return 100
        }
    }()
    
    let minHeight: CGFloat = {
        switch Platform.current {
        case .macOS: return 800
        default: return 100
        }
    }()
    
    
    init() {
//        overrideLanguage()
#if os(macOS)
        Task {
            NSApp.appearance = NSAppearance(named: .aqua)
        }
#endif
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(settings)
                .frame(minWidth: minWidth, maxWidth: .infinity, minHeight: minHeight, maxHeight: .infinity)
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
                .environment(\.layoutDirection, settings.isRightToLeft ? .rightToLeft : .leftToRight)
                .id(settings.isRightToLeft)

        }
    }
    
//    func overrideLanguage() {
//            if let selectedLanguage = UserDefaults.standard.string(forKey: "SelectedAppLanguage") {
//                let languageCode = selectedLanguage
//                let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") ?? Bundle.main.bundlePath
//                let bundle = Bundle(path: path) ?? .main
//                objc_setAssociatedObject(Bundle.main, &bundleKey, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            }
//        }
}

/* upload: sv_adjectives_colors.json
Hej. Tworzę aplikację do nauki języka szwedzkiego dla osób, które już znają inne języki. Potrzebuję więcej wyrazen z tłumaczeniami. Do każdego wyrazenia 4 przykłady zdań, które też są przetłumaczone. Potrzebuję te wyrazenia w formacie json. Wysyłam Ci plik json z przykładową inną kategorią i proszę stwórz nowy plik z poniższymi wyrazeniami. Wykorzystaj koniecznie wszystkie poniżej. Użyj wszystkie słowa. Aż do końca.

nyligen, idag, i morse, i kväll, i natt, om en stund, hädanefter, hittills, då och då, någon gång
*/




//
//
//import Foundation
//
//private var bundleKey: UInt8 = 0
//
//extension Bundle {
//    static let swizzleLocalization: Void = {
//        let originalSelector = #selector(Bundle.localizedString(forKey:value:table:))
//        let swizzledSelector = #selector(Bundle.customLocalizedString(forKey:value:table:))
//
//        let originalMethod = class_getInstanceMethod(Bundle.self, originalSelector)
//        let swizzledMethod = class_getInstanceMethod(Bundle.self, swizzledSelector)
//
//        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
//            method_exchangeImplementations(originalMethod, swizzledMethod)
//        }
//    }()
//
//    @objc func customLocalizedString(forKey key: String, value: String?, table: String?) -> String {
//        let bundle: Bundle
//        if let languageCode = UserDefaults.standard.string(forKey: "SelectedAppLanguage"),
//           let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") {
//            bundle = Bundle(path: path) ?? .main
//        } else {
//            bundle = .main
//        }
//        return bundle.customLocalizedString(forKey: key, value: value, table: table)
//    }
//}
