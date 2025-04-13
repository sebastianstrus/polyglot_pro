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
        refreshCategories()
    }
    
    func refreshCategories() {
        var combinedCategories = Dictionary(grouping: Category.builtInCases, by: { $0.catSection })
        
        let customCategories = CustomCategoryManager.shared.loadCustomCategories()
        combinedCategories[.custom] = customCategories
        
        categoriesBySection = combinedCategories.filter { !$0.value.isEmpty }
    }
}
