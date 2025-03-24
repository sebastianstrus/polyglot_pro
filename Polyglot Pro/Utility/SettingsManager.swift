//
//  SettingsManager.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

enum UserDefaultsKeys: String {
    case isSoundOn
    case speechRate
    case primaryLanguage
    case targetLanguage
}

class SettingsManager: ObservableObject {
    static let shared = SettingsManager()
    
    @AppStorage(UserDefaultsKeys.isSoundOn.rawValue) var isSoundOn: Bool = true
    @AppStorage(UserDefaultsKeys.speechRate.rawValue) var speechRate: Double = 0.4
    @AppStorage(UserDefaultsKeys.targetLanguage.rawValue) var targetLanguage: Language = .swedish
    
    private let userDefaults = UserDefaults.standard
    
    @Published var primaryLanguage: Language? = nil
        
    private init() {
        if let rawValue = userDefaults.string(forKey: UserDefaultsKeys.primaryLanguage.rawValue),
           let savedLanguage = Language(rawValue: rawValue) {
            primaryLanguage = savedLanguage
        } else {
            primaryLanguage = nil // Explicitly set to nil if not found in UserDefaults
        }
    }
    
    func savePrimaryLanguage(_ language: Language?) {
        primaryLanguage = language
        
        if let language = language {
            userDefaults.set(language.rawValue, forKey: UserDefaultsKeys.primaryLanguage.rawValue)
        } else {
            userDefaults.removeObject(forKey: UserDefaultsKeys.primaryLanguage.rawValue)
        }
        
        objectWillChange.send() // Notify SwiftUI
    }
}
