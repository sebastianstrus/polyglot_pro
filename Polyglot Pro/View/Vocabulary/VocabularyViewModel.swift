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
    
    @Published var categoriesBySection: [Category.CatSection: [Category]]
    
    init() {
        self.categoriesBySection = Dictionary(grouping: Category.allCases, by: { $0.catSection })
    }
}
