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


extension SettingsManager {
    // Get the key for completed categories for current target language
    private func completedCategoriesKey() -> String {
        return "\(UserDefaultsKeys.completedCategories.rawValue)_\(targetLanguage.rawValue)"
    }
    
    // Mark a category as completed
    func markCategoryAsCompleted(_ category: Category) {
        var completedCategories = getCompletedCategories()
        completedCategories.insert(category.rawValue)
        userDefaults.set(Array(completedCategories), forKey: completedCategoriesKey())
        objectWillChange.send()
    }
    
    // Check if a category is completed
    func isCategoryCompleted(_ category: Category) -> Bool {
        let completedCategories = getCompletedCategories()
        return completedCategories.contains(category.rawValue)
    }
    
    // Get all completed categories for current target language
    private func getCompletedCategories() -> Set<String> {
        let categories = userDefaults.array(forKey: completedCategoriesKey()) as? [String] ?? []
        return Set(categories)
    }
}
