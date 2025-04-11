//
//  VocabularyViewModel.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-07.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class VocabularyViewModel: ObservableObject {
    @Published private(set) var categoriesBySection: [Category.CatSection: [Category]] = [:]
    
    init() {
        // Load initial data
        refreshCategories()
    }
    
    func refreshCategories() {
        // Built-in categories grouped by section
        var combinedCategories = Dictionary(grouping: Category.builtInCases, by: { $0.catSection })
        
        // Load and add custom categories to the .custom section
        let customCategories = CustomCategoryManager.shared.loadCustomCategories()
        combinedCategories[.custom] = customCategories
        
        // Update the published property
        categoriesBySection = combinedCategories
        
        print("Loaded categories: \(categoriesBySection)")
    }
}
