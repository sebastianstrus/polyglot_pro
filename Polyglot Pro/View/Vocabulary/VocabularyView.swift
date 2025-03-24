//
//  ContentView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

struct VocabularyView: View {
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: Platform.current == .macOS ? 4 : 2)
    
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
    
    var body: some View {
        
        
        VStack {
            
            ScrollView(.vertical, showsIndicators: true) {
                Text("").frame(height: 80)
                LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                    ForEach(Category.allCases, id: \ .self) { category in
                        
                        NavigationLink(value: category) {
                            Text(category.rawValue)
                                .styledButton(.secondary)
                        }.buttonStyle(ScaleButtonStyle())
                    }
                }
                .padding(.top, Platform.current == .macOS ? 40 : 20)
                .padding(.bottom, 20)
                .navigationDestination(for: Category.self) { category in
                    LearnView(viewModel: LearnViewModel(category: category))
                }
                .navigationTitle("Vocabulary")
                
                Spacer()
            }
        }
        .background(
            GradientBackground().ignoresSafeArea()
            
        )
        
    }
}




