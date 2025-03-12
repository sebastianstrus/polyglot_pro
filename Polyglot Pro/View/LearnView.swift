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
        let allCount = viewModel.questions.count
        let count = (10...16).contains(allCount) ? 2 : max(1, Int(ceil(Double(allCount) / 16)))
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: count)
    }

    var body: some View {
            ZStack {
                gradientBackground
                    .ignoresSafeArea()
                
                if showWords {
                    VStack {
                        HStack {
                            backButton
                            Spacer()
                            categoryTitle
                            Spacer()
                            Text("")
                                .frame(width: 100)
                                .padding()
                        }
                        
                        Text("Försök att komma ihåg uttrycken.")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                        
                        Spacer()
                        
                        wordGrid
                        
                        Spacer()
                        
                        HStack {
                            startButton
                        }
                        .padding(.bottom, 80)
                    }
                    .frame(minWidth: 1100, maxWidth: .infinity, minHeight: 800, maxHeight: .infinity)
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
        }.buttonStyle(ScaleButtonStyle())
    }
    
    private var categoryTitle: some View {
        Text(viewModel.category.rawValue)
            .font(.system(size: 36, weight: .bold, design: .rounded))
            .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
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
        .frame(maxWidth: .infinity)
        .padding()
    }
}






