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
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: Platform.current == .iOS ? 2 : 4)
    
    let size: CGFloat = {
        switch Platform.current {
        case .macOS: return 50.0
        default: return 24
        }
    }()
    
    let paddingTop: CGFloat = {
        switch Platform.current {
        case .macOS: return 20
        default: return 12
        }
    }()
    
    let paddingBottom: CGFloat = {
        switch Platform.current {
        case .macOS: return 12
        default: return 4
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
        default: return 11
        }
    }()
    
    let btnFontSize2: CGFloat = {
        switch Platform.current {
        case .macOS: return 20
        default: return 11
        }
    }()
    
    let btnWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 300
        default: return 150
        }
    }()
    
    let btnHeight: CGFloat = {
        switch Platform.current {
        case .macOS: return 70
        default: return 40
        }
    }()
    
    let radius: CGFloat = {
        switch Platform.current {
        case .macOS: return 12
        default: return 6
        }
    }()
    
    // Group categories by their section
    var categoriesBySection: [Category.CatSection: [Category]] {
        Dictionary(grouping: Category.allCases, by: { $0.catSection })
    }
    
    var body: some View {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    Text("").frame(height: 10)
                    
                    // Iterate through each section
                    ForEach(Category.CatSection.allCases, id: \.self) { section in
                        if let categories = categoriesBySection[section] {
                            VStack(spacing: 10) {
                                // Section Header
                                sectionHeader(for: section)
                                
                                // Categories Grid
                                LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                                    ForEach(categories, id: \.self) { category in
                                        NavigationLink(value: category) {
                                            categoryItem(for: category)
                                            
                                        }
                                        .buttonStyle(ScaleButtonStyle())
                                    }
                                }
                                .padding(.top, 10)
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
                                }
                            }
                        }
                    }
                    .navigationDestination(for: Category.self) { category in
                        LearnView(viewModel: LearnViewModel(settings: settings, category: category))
                    }
                    .navigationTitle("Vocabulary".localized)
                    
                    Spacer()
                }
            }
            .background(
                GradientBackground().ignoresSafeArea()
            )
        }
        
        // Helper function to create section headers
        private func sectionHeader(for section: Category.CatSection) -> some View {
            HStack {
                Text(section.displayName.localized)
                    .styledTitel()
                    .padding(.top, 26)
                    .padding(.leading, 40)
                Spacer()
            }
        }
    
    private func categoryItem(for category: Category, isSolved: Bool = false) -> some View {
        VStack {
            Text(category.targetName)
                .foregroundColor(.white)
                .font(.system(size: btnFontSize, weight: .bold))
            Text("(\(category.primaryName))")
                .foregroundColor(.white.opacity(0.8))
                .font(.system(size: btnFontSize2 - 2, weight: .regular))
        }
        .frame(width: btnWidth, height: btnHeight)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .overlay(
            isSolved ?
                RoundedRectangle(cornerRadius: radius + 1)
                    .stroke(Color.green, lineWidth: 10)
                : nil
            )
        .cornerRadius(radius)
        .shadow(color: Color.green, radius: isSolved ? 8 : 0)
    }
    
    
    }
