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
    
    //let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: Platform.current == .iOS ? 2 : 4)
    
    let columns: [GridItem] = {
        let count: Int
        switch Platform.current {
        case .iOS: count = 2
        case .iPadOS: count = 3
        case .macOS: count = 4
        case .unknown: count = 3
        }
        
        return Array(repeating: GridItem(.flexible(), spacing: 0), count: count)
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
        default: return 11
        }
    }()
    
    let btnFontSize2: CGFloat = {
        switch Platform.current {
        case .macOS: return 20
        case .iPadOS: return 16
        default: return 11
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
        default: return 40
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
    
    var categoriesBySection: [Category.CatSection: [Category]] {
        Dictionary(grouping: Category.allCases, by: { $0.catSection })
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                
                Text("").frame(height: paddingTop)
                
                ForEach(Category.CatSection.allCases, id: \.self) { section in
                    if let categories = categoriesBySection[section] {
                        VStack(spacing: 10) {
                            sectionHeader(for: section)
                            
                            LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                                ForEach(categories, id: \.self) { category in
                                    NavigationLink(value: category) {
                                        categoryItem(for: category, isSolved: settings.isCategoryCompleted(category))
                                        
                                    }
                                    .buttonStyle(ScaleButtonStyle())
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
                .navigationDestination(for: Category.self) { category in
                    LearnView(viewModel: LearnViewModel(settings: settings, category: category))
                }
                
                Spacer()
            }
        }
        .padding(.bottom, 20)
        .customTitle("Vocabulary".localized)
        
        .background(
            GradientBackground().ignoresSafeArea()
        )
        
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
                .stroke(Color.green, lineWidth: lineWidth)
            : nil
        )
        .cornerRadius(radius)
        .shadow(color: Color.green, radius: isSolved ? 8 : 0)
    }
}
