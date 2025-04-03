//
//  Strings+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-25.
//

import Foundation

extension String {
    var localized: String {
        
        print("TEST100 translating")
        // Use the selected language if available, otherwise use system language
        if let primaryLanguage = SettingsManager.shared.primaryLanguage,
           let path = Bundle.main.path(forResource: primaryLanguage.localeIdentifier, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            
            print("TEST100 translating to: \(primaryLanguage.localeIdentifier)")
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        }
        print("TEST100 translating \(self) to \(NSLocalizedString(self, comment: ""))")
        return self//NSLocalizedString(self, comment: "")
    }
//    var localized: String {
//        NSLocalizedString(self, comment: "")
//    }
    
    func localized(with arguments: CVarArg...) -> String {
        String(format: localized, arguments: arguments)
    }
    
    
    var targetLocalized: String {
        // Use the selected language if available, otherwise use system language
        let targetLanguage = SettingsManager.shared.targetLanguage
        if let path = Bundle.main.path(forResource: targetLanguage.localeIdentifier, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        }
        return self//NSLocalizedString(self, comment: "")
    }
    
    func targetLocalized(with arguments: CVarArg...) -> String {
        String(format: targetLocalized, arguments: arguments)
    }
}
