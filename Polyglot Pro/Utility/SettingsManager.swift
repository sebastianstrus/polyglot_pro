//
//  SettingsManager.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

enum UserDefaultsKeys: String {
    case isSoundOn
    case isCountingMistakes
    case isConfettiOn
    case isDarkMode
    case speechRate
    case primaryLanguage
    case appleLanguages = "AppleLanguages"
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
    @AppStorage(UserDefaultsKeys.targetLanguage.rawValue) var targetLanguage: Language = .swedish
    
    private let userDefaults = UserDefaults.standard
    
    @Published var layoutDirection: LayoutDirection = .leftToRight
    
    @Published var primaryLanguage: Language? = nil {
        didSet {
            self.layoutDirection = primaryLanguage == .arabic || primaryLanguage == .urdu ? .rightToLeft : .leftToRight
        }
    }
        
    private init() {
        print("TEST100 SettingsManager init with array: \(userDefaults.array(forKey: UserDefaultsKeys.primaryLanguage.rawValue))")
        if let langArray = userDefaults.array(forKey: UserDefaultsKeys.primaryLanguage.rawValue),
           let identifier = langArray.first {
            print("TEST100 SettingsManager init identifier: \(identifier)")
            
            let savedLanguage = Language(localeIdentifier: identifier as! String)
            print("TEST100 SettingsManager init identifier: \(savedLanguage)")
            
            primaryLanguage = savedLanguage
            
            self.layoutDirection = savedLanguage == .arabic ? .rightToLeft : .leftToRight
            
            
        }
    }
    
    func savePrimaryLanguage(_ language: Language?) {
        if let language = language {
            primaryLanguage = language
            userDefaults.set([language.localeIdentifier], forKey: UserDefaultsKeys.primaryLanguage.rawValue)
            userDefaults.set([language.localeIdentifier], forKey: UserDefaultsKeys.appleLanguages.rawValue)
        }
        
        objectWillChange.send()
    }

    private func completedCategoriesKey() -> String {
        return "\(UserDefaultsKeys.completedCategories.rawValue)_\(targetLanguage.rawValue)"
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
        primaryLanguage = .english
        targetLanguage = .swedish
        speechRate = 0.4
    }
    
    func updateLanguage() {
        if let langArray = userDefaults.array(forKey: UserDefaultsKeys.primaryLanguage.rawValue), !langArray.isEmpty {
            if let appleLangArray = userDefaults.array(forKey: UserDefaultsKeys.appleLanguages.rawValue),
               let identifier = appleLangArray.first {
                
                let appleLanguage = Language(languageTag: identifier as! String)
//                let appleLanguage = Language(localeIdentifier: identifier as! String)
                savePrimaryLanguage(appleLanguage)
            }
        }
    }
    
    func clearUserDefaultsAndCloseApp() {

        if let bundleID = Bundle.main.bundleIdentifier {
            userDefaults.removePersistentDomain(forName: bundleID)
            userDefaults.removeObject(forKey: UserDefaultsKeys.primaryLanguage.rawValue)
            userDefaults.removeObject(forKey: UserDefaultsKeys.appleLanguages.rawValue)
            userDefaults.synchronize()
        }
        
        print("userDefaults.object(forKey: UserDefaultsKeys.appleLanguages.rawValue)\(userDefaults.object(forKey: UserDefaultsKeys.appleLanguages.rawValue))")
        
#if os(macOS)
        NSApplication.shared.terminate(nil)
#else
        exit(0)
#endif
        
    }
}
