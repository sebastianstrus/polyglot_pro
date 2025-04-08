//
//  ContentView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI



struct VocabularyView: View {
    @EnvironmentObject var settings: SettingsManager
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = VocabularyViewModel()
    
    @State private var showingAddCategory = false
    @State private var editingCategory: Category?
    
    var body: some View {
        List {
            // Built-in categories sections
            ForEach(Category.CatSection.allCases.filter { $0 != .custom }, id: \.self) { section in
                if let categories = viewModel.categoriesBySection[section], !categories.isEmpty {
                    Section(header: Text(section.displayName.localized).font(.headline)) {
                        ForEach(categories, id: \.self) { category in
                            NavigationLink(value: category) {
                                categoryRow(for: category)
                            }
                        }
                    }
                }
            }
            
            // Custom categories section
            if !viewModel.customCategories.isEmpty {
                Section(header: Text("Custom".localized).font(.headline)) {
                    ForEach(viewModel.customCategories, id: \.self) { category in
                        NavigationLink(value: category) {
                            categoryRow(for: category)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                deleteCustomCategory(category)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button {
                                editCustomCategory(category)
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.blue)
                        }
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationDestination(for: Category.self) { category in
            LearnView(viewModel: LearnViewModel(settings: settings, category: category))
        }
        .sheet(isPresented: $showingAddCategory) {
            NavigationView {
                CreateEditCategoryView()
                    .onDisappear {
                        viewModel.refreshCustomCategories()
                    }
            }
        }
        .sheet(item: $editingCategory) { category in
            if case let .custom(name) = category {
                NavigationView {
                    CreateEditCategoryView(categoryName: name, questions: CustomCategoryManager.shared.loadQuestions(for: category))
                        .onDisappear {
                            viewModel.refreshCustomCategories()
                        }
                }
            }
        }
        .navigationTitle("Vocabulary".localized)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddCategory = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    private func categoryRow(for category: Category) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(category.targetName)
                .font(.headline)
            
            Text(category.primaryName)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
    
    private func deleteCustomCategory(_ category: Category) {
        let alert = UIAlertController(
            title: "Delete Category",
            message: "Are you sure you want to delete this category?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
            CustomCategoryManager.shared.deleteCustomCategory(category)
            viewModel.refreshCustomCategories()
        })
    }
                        
                        
                        // Present the alert (you'll need to use UIViewControllerRepresentable in SwiftUI)
                        
    
    private func editCustomCategory(_ category: Category) {
        editingCategory = category
    }
}
