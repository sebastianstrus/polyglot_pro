//
//  LearnView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct LearnView: View {
    @ObservedObject var viewModel: LearnViewModel
    @Binding var showMenu: Bool
    @State var showWords = true
    
    private var columns: [GridItem] {
        switch Platform.current {
        case .macOS:
            let allCount = viewModel.questions.count
            let count = (10...16).contains(allCount) ? 2 : max(1, Int(ceil(Double(allCount) / 16)))
            return Array(repeating: GridItem(.flexible(), spacing: 10), count: count)
        default:
            return [GridItem(.flexible())]
        }
    }
    
    var body: some View {
        ZStack {
            gradientBackground
                .ignoresSafeArea()
            
            if showWords {
                VStack {
                    ZStack {
                        HStack {
                            backButton
                            Spacer()
                        }
                        
                        categoryTitle
                    }
                    
                    
                    Text("Försök att komma ihåg \(viewModel.questions.count) uttrycken.")
                        .styledSubtitel()
                    
                    Spacer()
                    
                    wordGrid
                    
                    Spacer()
                    
                    HStack {
                        startButton
                    }
                    .padding(.bottom, Platform.current == .macOS ? 80 : 30)
                    .padding(.top, Platform.current == .macOS ? 0 : 8)
                }
            } else {
                QuizView(viewModel: viewModel, showMenu: $showMenu)
            }
        }
    }
    
    private var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var backButton: some View {
        Button(action: {
            showWords = false
            showMenu = true
        }) {
            Text("Tillbaka")
                .styledButton()
                .padding()
                .padding(.top, 16)
        }.buttonStyle(ScaleButtonStyle())
    }
    
    private var categoryTitle: some View {
        Text(viewModel.category.rawValue)
            .styledTitel()
            .padding(.top, 40)
            .padding(.bottom, 6)
    }
    
    private var startButton: some View {
        Button(action: {
            showWords = false
        }) {
            Text("Start")
                .styledButton()
        }.buttonStyle(ScaleButtonStyle())
    }
    
    private var wordGrid: some View {
        VStack(alignment: .center) {
            ScrollView {
                
                ZStack {
                    Spacer().containerRelativeFrame([.vertical])
                    
                    VStack {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            ForEach(viewModel.questionsBase, id: \.expression) { question in
                                HStack(alignment: .center) {
                                    Text(question.translation)
                                        .styledText(color: .blue)
                                    Text("–")
                                        .styledText(color: .gray)
                                    Text(question.expression)
                                        .styledText(color: .purple)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }.scrollBounceBehavior(.basedOnSize)
        }
        .frame(maxWidth: .infinity)
    }
}
