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
    
    
    //let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: Platform.current == .iOS ? 2 : 4)
    
    let columns: [GridItem] = {
        let count: Int
        switch Platform.current {
        case .iOS: count = 1
        case .iPadOS: count = 3
        case .macOS: count = 4
        case .unknown: count = 3
        }
        
        return Array(repeating: GridItem(.flexible(), spacing: 0), count: count)
    }()
    
    let alignment: Alignment = {
        switch Platform.current {
        case .iOS: return .leading
        default: return .center
        }
    }()
    
    let horizontalAlignment: HorizontalAlignment = {
        switch Platform.current {
        case .iOS: return .leading
        default: return .center
        }
    }()
    
    let size: CGFloat = {
        switch Platform.current {
        case .macOS: return 50.0
        default: return 24
        }
    }()
    
    let spacing: CGFloat = {
        switch Platform.current {
        case .macOS: return 36
        default: return 14
        }
    }()
    
    let btnFontSize: CGFloat = {
        switch Platform.current {
        case .macOS: return 20
        case .iPadOS: return 16
        default: return 16
        }
    }()
    
    let btnFontSize2: CGFloat = {
        switch Platform.current {
        case .macOS: return 20
        case .iPadOS: return 16
        default: return 16
        }
    }()
    
    let btnWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 300
        case .iPadOS: return 250
        default: return 150
        }
    }()
    
    let btnHeight: CGFloat = {
        switch Platform.current {
        case .macOS: return 70
        case .iPadOS: return 55
        default: return 54
        }
    }()
    
    let radius: CGFloat = {
        switch Platform.current {
        case .macOS: return 12
        case .iPadOS: return 8
        default: return 6
        }
    }()
    
    let lineWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 10
        default: return 5
        }
    }()
    
    let paddingTop: CGFloat = {
        switch Platform.current {
        case .macOS: return 40
        case .iPadOS: return 30
        default: return 20
        }
    }()
    
    @State private var showingAddCategory = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack(spacing: 0)  {
                
                Text("").frame(height: paddingTop)
                
                ForEach(Category.CatSection.allCases, id: \.self) { section in
                    if let categories = viewModel.categoriesBySection[section] {
                        VStack(spacing: 10) {
                            sectionHeader(for: section)
                            
                            LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                                
                                ForEach(categories, id: \.self) { category in
                                    NavigationLink(value: category) {
                                        NavigationLink(value: category) {
                                            EmptyView()
                                        }
                                        .opacity(0)
                                        
                                        categoryItem(for: category, isSolved: settings.isCategoryCompleted(category))
                                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                                if case .custom = category {
                                                    Button(role: .destructive) {
                                                        deleteCategory(category)
                                                    } label: {
                                                        Label("Delete", systemImage: "trash")
                                                    }
                                                }
                                            }
                                        
                                    }
                                }
                            }
                            .padding(.bottom, 10)
                            
                            // Horizontal Line (Divider)
                            if section != Category.CatSection.allCases.last {
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            colors: [.blue, .purple],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(height: 2)
                                    .padding(.horizontal, 40)
                                    .padding(.top, 10)
                                    .padding(.bottom, 26)
                            }
                        }
                    }
                }
                
                
                Spacer()
            }
            .navigationDestination(for: Category.self) { category in
                LearnView(viewModel: LearnViewModel(settings: settings, category: category))
            }
        }
        .sheet(isPresented: $showingAddCategory) {
            NavigationView {
                CreateEditCategoryView {
                    viewModel.refreshCategories()
                }
            }
        }
        .padding(.bottom, 20)
        .customTitle("Vocabulary".localized)
        .toolbar {
            ToolbarItem {
                Button(action: {
                    showingAddCategory = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: size))
                        .foregroundColor(.purple)
                }
            }
        }
        
        .background(
            GradientBackground().ignoresSafeArea()
        )
        
    }
    
    
    
    // Function to handle category deletion
    private func deleteCategory(_ category: Category) {
        CustomCategoryManager.shared.deleteCustomCategory(category)
        viewModel.refreshCategories()
    }
    
    private func sectionHeader(for section: Category.CatSection) -> some View {
        HStack {
            Text(section.displayName.localized)
                .styledTitel()
                .padding(.leading, 40)
            Spacer()
        }
    }
    
    private func categoryItem(for category: Category, isSolved: Bool = false) -> some View {
        CategoryItem(
            category: category,
            isSolved: isSolved,
            horizontalAlignment: horizontalAlignment,
            btnFontSize: btnFontSize,
            btnFontSize2: btnFontSize2,
            btnWidth: btnWidth,
            btnHeight: btnHeight,
            radius: radius,
            lineWidth: lineWidth,
            deleteAction: { deleteCategory(category) }
        )
    }
}


struct CategoryItem: View {
    let category: Category
    let isSolved: Bool
    let horizontalAlignment: HorizontalAlignment
    let btnFontSize: CGFloat
    let btnFontSize2: CGFloat
    let btnWidth: CGFloat
    let btnHeight: CGFloat
    let radius: CGFloat
    let lineWidth: CGFloat
    let deleteAction: () -> Void
    
    @State private var offset: CGFloat = 0.0
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Swipe action buttons (hidden behind the main content)
            if case .custom = category {
                HStack {
                    Spacer()
                    Button(action: {
                        deleteAction()
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    .padding(.trailing, 20)
                }
            }
            
            // Main content
            HStack {
                VStack(alignment: horizontalAlignment) {
                    Text(category.targetName)
                        .foregroundColor(.white)
                        .font(.system(size: btnFontSize, weight: .bold))
                    Text("(\(category.primaryName))")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: btnFontSize2 - 2, weight: .regular))
                }
                
                Spacer()
                
                if Platform.current == .iOS {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.system(size: btnFontSize - 4, weight: .bold))
                }
            }
            .padding(.horizontal, Platform.current == .iOS ? 20 : 0)
            .frame(maxWidth: Platform.current == .iOS ? .infinity : btnWidth, minHeight: btnHeight)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .overlay(
                isSolved ?
                RoundedRectangle(cornerRadius: radius + 1)
                    .stroke(Color.green, lineWidth: lineWidth)
                : nil
            )
            .cornerRadius(radius)
            .shadow(color: Color.green, radius: isSolved ? 8 : 0)
            .padding(.horizontal, Platform.current == .iOS ? 20 : 0)
            .offset(x: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        if case .custom = category { // Only allow swiping for custom categories
                            if value.translation.width < 0 {
                                offset = max(value.translation.width, -80)
                            } else if offset < 0 {
                                // Allow dragging back to original position
                                offset = min(value.translation.width, 0)
                            }
                        }
                    }
                    .onEnded { value in
                        if case .custom = category {
                            if value.translation.width < -40 {
                                offset = -80
                            } else {
                                offset = 0
                            }
                        }
                    }
            )
            .animation(.easeInOut, value: offset)
        }
    }
}
