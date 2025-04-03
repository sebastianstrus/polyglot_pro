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
    case primaryLanguage// = "AppleLanguages"
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
    
    @Published var isRightToLeft: Bool = false
    
    @Published var primaryLanguage: Language? = nil {
        didSet {
            if let primaryLanguage = primaryLanguage {
                
                userDefaults.set([primaryLanguage.localeIdentifier], forKey: "AppleLanguages")
                
                
                if primaryLanguage == .arabic || primaryLanguage == .urdu {
                    UIView.appearance().semanticContentAttribute = .forceRightToLeft
                } else {
                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
                }
                
                isRightToLeft = primaryLanguage == .arabic || primaryLanguage == .urdu
            }
        }
    }
    
    private init() {
        print("TEST100 SettingsManager init")
        if let appleLanguages = userDefaults.value(forKey: UserDefaultsKeys.primaryLanguage.rawValue) as? [String],
           let identified = appleLanguages.first {
            
            let lang = Language(localeIdentifier: identified)
            print("TEST100 assign: \(lang)")
            primaryLanguage = Language(localeIdentifier: identified)
        } else {
            print("TEST100 assign: nil")
            primaryLanguage = nil
        }
    }
    
    func savePrimaryLanguage(_ language: Language?) {
        primaryLanguage = language
        
        if let language = language {
            userDefaults.set([language.localeIdentifier], forKey: UserDefaultsKeys.primaryLanguage.rawValue)
            UserDefaults.standard.synchronize()
        } else {
            userDefaults.removeObject(forKey: UserDefaultsKeys.primaryLanguage.rawValue)
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
    
    func clearUserDefaultsAndCloseApp() {
        let defaults = UserDefaults.standard
        if let bundleID = Bundle.main.bundleIdentifier {
            defaults.removePersistentDomain(forName: bundleID)
            defaults.synchronize()
        }
        
#if os(macOS)
        NSApplication.shared.terminate(nil)
#else
        
        userDefaults.set([], forKey: UserDefaultsKeys.primaryLanguage.rawValue)
        userDefaults.set([], forKey: "AppleLanguages")
        
        
        if let appleLanguages = userDefaults.value(forKey: UserDefaultsKeys.primaryLanguage.rawValue) as? [String],
           let identifier = appleLanguages.first {
            
            let lang = Language(localeIdentifier: identifier)
            print("TEST100 lang1 is: \(lang)")
        } else {
            print("TEST100 lang1 is: nil")
        }
        
        if let appleLanguages = userDefaults.value(forKey: "AppleLanguages") as? [String],
           let identifier = appleLanguages.first {
            
            let lang = Language(localeIdentifier: identifier)
            print("TEST100 lang2 is: \(lang)")
        } else {
            print("TEST100 lang2 is: nil")
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                exit(0)
            }

#endif
    }
}
