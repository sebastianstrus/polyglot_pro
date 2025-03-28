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
    case targetLanguage
    case completedCategories
    case selectedTheme
}


enum ThemeMode: String, CaseIterable, Identifiable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
    
    var id: String { self.rawValue }
}

class SettingsManager: ObservableObject {
    static let shared = SettingsManager()
    
    @AppStorage(UserDefaultsKeys.isSoundOn.rawValue) var isSoundOn: Bool = true
    @AppStorage(UserDefaultsKeys.isConfettiOn.rawValue) var isConfettiOn: Bool = true
    @AppStorage(UserDefaultsKeys.isCountingMistakes.rawValue) var isCountingMistakes: Bool = true
    @AppStorage(UserDefaultsKeys.isDarkMode.rawValue) var isDarkMode: Bool = false
    @AppStorage(UserDefaultsKeys.speechRate.rawValue) var speechRate: Double = 0.4
    @AppStorage(UserDefaultsKeys.targetLanguage.rawValue) var targetLanguage: Language = .swedish
    @AppStorage(UserDefaultsKeys.selectedTheme.rawValue) private var storedSelectedTheme: String = ThemeMode.system.rawValue
    
    @Published var selectedTheme: ThemeMode = .system {
        didSet {
            storedSelectedTheme = selectedTheme.rawValue
        }
    }
    
    private let userDefaults = UserDefaults.standard
    
    @Published var primaryLanguage: Language? = nil
        
    private init() {
        if let rawValue = userDefaults.string(forKey: UserDefaultsKeys.primaryLanguage.rawValue),
           let savedLanguage = Language(rawValue: rawValue) {
            primaryLanguage = savedLanguage
        } else {
            primaryLanguage = nil
        }
        
        if let theme = ThemeMode(rawValue: storedSelectedTheme) {
            selectedTheme = theme
        }
    }
    
    func savePrimaryLanguage(_ language: Language?) {
        primaryLanguage = language
        
        if let language = language {
            userDefaults.set(language.rawValue, forKey: UserDefaultsKeys.primaryLanguage.rawValue)
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
}
