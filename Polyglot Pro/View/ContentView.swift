//
//  ContentView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = true
    @State private var selectedCategory: QuestionCategory? = nil
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        if showMenu {
            VStack {
                
                Text("Polyglot Pro")
                    .font(.system(size: 58, weight: .bold, design: .rounded))
                    .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                    .padding(.top, 46)
                    .padding(.bottom, 6)
                
                Spacer()
                
                LazyVGrid(columns: columns, spacing: 50) {
                    ForEach(QuestionCategory.allCases, id: \ .self) { category in
                        
                        let number = DataProvider.questions(for: category).count
                        Button(action: {
                            selectedCategory = category
                            showMenu = false
                        }) {
                            Text("\(category.rawValue) (\(number))")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                        }
                        .frame(width: 300, height: 50)
                        .buttonStyle(ScaleButtonStyle())
                    }
                }
                
                Spacer()
                Spacer()
            }
            .frame(minWidth:800, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
            .background(
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]),
                    startPoint: .top,
                    endPoint: .bottom)
                
                
            )
            .ignoresSafeArea()
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
