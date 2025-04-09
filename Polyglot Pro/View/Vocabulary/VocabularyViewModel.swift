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
    @Published var selectedCategory: Category? = nil
    @Published var categoriesBySection: [Category.CatSection: [Category]]
    @Published var customCategories: [Category] = []
    
    init() {
        // Built-in categories
        self.categoriesBySection = Dictionary(grouping: Category.builtInCases, by: { $0.catSection })
        
        // Load custom categories
        self.customCategories = CustomCategoryManager.shared.loadCustomCategories()
        
        print("Loaded custom categories: \(customCategories)")
    }
    
    func refreshCustomCategories() {
        customCategories = CustomCategoryManager.shared.loadCustomCategories()
    }
}
