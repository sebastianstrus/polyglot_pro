//
//  Strings+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-25.
//

import Foundation

//extension String {
//    var localized: String {
//        // Use the selected language if available, otherwise use system language
//        if let languageCode = SettingsManager.shared.currentPrimaryLanguageCode,
//           let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
//           let bundle = Bundle(path: path) {
//            return bundle.localizedString(forKey: self, value: nil, table: nil)
//        }
//        return NSLocalizedString(self, comment: "")
//    }
//    
//    func localized(with arguments: CVarArg...) -> String {
//        String(format: localized, arguments: arguments)
//    }
//}
