//
//  SettingsManager.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI
#if os(macOS)
import AppKit
#endif


enum UserDefaultsKeys: String {
    case isSoundOn
    case isCountingMistakes
    case isConfettiOn
    case isDarkMode
    case speechRate
    case primaryLanguage = "AppleLanguages"
    case targetLanguage
    case completedCategories
}




class SettingsManager: ObservableObject {
    static let shared = SettingsManager()
    
    @AppStorage(UserDefaultsKeys.isSoundOn.rawValue) var isSoundOn: Bool = true
    @AppStorage(UserDefaultsKeys.isConfettiOn.rawValue) var isConfettiOn: Bool = true
    @AppStorage(UserDefaultsKeys.isCountingMistakes.rawValue) var isCountingMistakes: Bool = true
    @AppStorage(UserDefaultsKeys.isDarkMode.rawValue) var isDarkMode: Bool = false
    @AppStorage(UserDefaultsKeys.speechRate.rawValue) var speechRate: Double = 0.4
    @AppStorage(UserDefaultsKeys.targetLanguage.rawValue) var targetLanguage: Language?
    
    private let userDefaults = UserDefaults.standard
    
    @Published var primaryLanguage: Language
        
    private init() {
        if let appleLanguages = userDefaults.array(forKey: UserDefaultsKeys.primaryLanguage.rawValue),
           let code = appleLanguages.first as? String,
           let appLanguage = Language(localeIdentifier: appleLanguages.first! as! String) {
            primaryLanguage = appLanguage
        } else {
            primaryLanguage = .english
        }
    }
    
//    func savePrimaryLanguage(_ language: Language?) {
//        primaryLanguage = language
//        
//        if let language = language {
//            userDefaults.set(language.rawValue, forKey: UserDefaultsKeys.primaryLanguage.rawValue)
//        } else {
//            userDefaults.removeObject(forKey: UserDefaultsKeys.primaryLanguage.rawValue)
//        }
//        
//        objectWillChange.send()
//    }

    private func completedCategoriesKey() -> String {
        return "\(UserDefaultsKeys.completedCategories.rawValue)_\(targetLanguage!.rawValue)"
    }
    
    func markCategoryAsCompleted(_ category: Category) {
        var completedCategories = getCompletedCategories()
        completedCategories.insert(category.rawValue)
        userDefaults.set(Array(completedCategories), forKey: completedCategoriesKey())
        objectWillChange.send()
    }
    
    func isCategoryCompleted(_ category: Category) -> Bool {
        let completedCategories = getCompletedCategories()
        return completedCategories.contains(category.rawValue)
    }
    
    private func getCompletedCategories() -> Set<String> {
        let categories = userDefaults.array(forKey: completedCategoriesKey()) as? [String] ?? []
        return Set(categories)
    }
    
    func resetCompletedCategories() {
        userDefaults.removeObject(forKey: completedCategoriesKey())
        objectWillChange.send()
    }
    
    func resetSettings() {
        isCountingMistakes = true
        isConfettiOn = true
        isSoundOn = true
        isDarkMode = false
//        primaryLanguage = .english
        targetLanguage = .swedish
        speechRate = 0.4
    }
    
    func updateLanguage() {
//        if let langArray = userDefaults.array(forKey: UserDefaultsKeys.primaryLanguage.rawValue), !langArray.isEmpty {
            if let appleLangArray = userDefaults.array(forKey: UserDefaultsKeys.primaryLanguage.rawValue),
               let identifier = appleLangArray.first,
               let appleLanguage = Language(localeIdentifier: identifier as! String) {
                primaryLanguage = appleLanguage
            }
//        }
    }
    
    func openAppLanguageSettings() {
#if os(iOS)
        guard let bundleId = Bundle.main.bundleIdentifier,
              let settingsUrl = URL(string: UIApplication.openSettingsURLString + "&path=\(bundleId)/LANGUAGE") else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl)
        }
#else
        if let url = URL(string: "x-apple.systempreferences:com.apple.Localization-Settings.extension") {
            NSWorkspace.shared.open(url)
        }
        
#endif
    }
    
    func clearUserDefaultsAndCloseApp() {
        let defaults = UserDefaults.standard
        if let bundleID = Bundle.main.bundleIdentifier {
            defaults.removePersistentDomain(forName: bundleID)
            defaults.synchronize()
        }
        
#if os(macOS)
        NSApplication.shared.terminate(nil)
#else
        exit(0)
#endif
        
    }
}
