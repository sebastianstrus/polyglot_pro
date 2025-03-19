//
//  ContentView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

struct VocabularyView: View {
    @State private var showMenu = true
    @State private var selectedCategory: QuestionCategory? = nil
    
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
        
        if showMenu {
            VStack {
                
                Text("Polyglot Pro")
                    .font(.system(size: size, weight: .bold, design: .rounded))
                    .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                    .padding(.top, paddingTop)
                    .padding(.bottom, paddingBottom)
                
                Spacer()
                
                ZStack {
                    ScrollView(.vertical, showsIndicators: true) {
                        LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                            
                            ForEach(QuestionCategory.allCases, id: \ .self) { category in
                                let number = DataProvider.questions(for: category).count
                                Button(action: {
                                    selectedCategory = category
                                    showMenu = false
                                }) {
                                    Text("\(category.rawValue) (\(number))")
                                        .styledButton(.secondary)
                                }
                                .buttonStyle(ScaleButtonStyle())
                            }
                        }
                        .padding(.top, Platform.current == .macOS ? 40 : 20)
                        .padding(.bottom, 20)
                    }
                    
                    VStack {
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.2), Color.clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 20)
                        
                        Spacer()
                        
                        LinearGradient(
                            gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.2)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 20)
                    }
                    .allowsHitTesting(false)
                }
                
                Spacer(minLength: 0)
                Spacer(minLength: 0)
            }
            .background(
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]),
                    startPoint: .top,
                    endPoint: .bottom)
            )
        } else {
            if let category = selectedCategory {
                LearnView(viewModel: LearnViewModel(category: category), showMenu: $showMenu)
            }
        }
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let translation = sin(animatableData * .pi * 6) * 8
        return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
    }
}
