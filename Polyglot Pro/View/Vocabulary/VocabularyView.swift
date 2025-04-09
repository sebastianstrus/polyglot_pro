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
    
    init() {
        // Hide chevron for all list items
        UITableView.appearance().tintColor = .clear
    }
    
    var body: some View {
            ZStack {
                GradientBackground()
                    .ignoresSafeArea()
                
                List {
                    // Built-in categories sections
                    ForEach(Category.CatSection.allCases.filter { $0 != .custom }, id: \.self) { section in
                        if let categories = viewModel.categoriesBySection[section], !categories.isEmpty {
                            Section(header:
                                        Text(section.displayName.localized)
                                .styledTitel()) {
                                ForEach(categories, id: \.self) { category in
                                    listItem(for: category)
                                }
                            }
                        }
                    }
                    
                    // Custom categories section
                    if !viewModel.customCategories.isEmpty {
                        Section(header: Text("Custom".localized)
                            .styledTitel()) {
                            ForEach(viewModel.customCategories, id: \.self) { category in
                                listItem(for: category, isCustom: true)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
                // Add these modifiers to hide the chevron:
                .environment(\.defaultMinListRowHeight, 10) // Helps reduce spacing
                .environment(\.defaultMinListHeaderHeight, 10)
            
            }
        .navigationDestination(isPresented: Binding<Bool>(
            get: { viewModel.selectedCategory != nil },
            set: { if !$0 { viewModel.selectedCategory = nil } }
        )) {
            if let category = viewModel.selectedCategory {
                LearnView(viewModel: LearnViewModel(settings: settings, category: category))
            }
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
    
    private func listItem(for category: Category, isCustom: Bool = false) -> some View {
        ZStack {
            // Hidden NavigationLink
            NavigationLink(value: category) {
                EmptyView()
            }
            .opacity(0)
            
            // Visible content with tap gesture
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                
                HStack {
                    categoryRow(for: category)
                    Spacer()
                }
                .padding(.horizontal, 12)
            }
            .contentShape(Rectangle()) // Make entire area tappable
            .onTapGesture {
                // Programmatically trigger navigation
                viewModel.selectedCategory = category
            }
        }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
        .if(isCustom) { view in
            view.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                // Delete button
                Button(role: .destructive) {
                    deleteCustomCategory(category)
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: "trash")
                            .font(.system(size: 18, weight: .bold))
                        Text("Delete")
                            .font(.caption2)
                    }
                }
                .tint(.clear)
                
                // Edit button
                Button {
                    editCustomCategory(category)
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: "pencil")
                            .font(.system(size: 18, weight: .bold))
                        Text("Edit")
                            .font(.caption2)
                    }
                    .foregroundColor(.white)
                }
                .tint(.clear)
            }
        }
    }
    
    
    
    private func categoryRow(for category: Category) -> some View {
            VStack(alignment: .leading, spacing: 0) {
                Text(category.targetName)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white) // Ensure text is visible
                
                Text(category.primaryName)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
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


extension View {
        @ViewBuilder
        func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
            if condition {
                transform(self)
            } else {
                self
            }
        }
    }


struct SwipeActionButtonStyle: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .tint(.clear)
                .foregroundColor(color)
        } else {
            content
                .background(Color.clear)
                .foregroundColor(color)
        }
    }
}
