//
//  LearnView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct LearnView: View {
    @ObservedObject var viewModel: LearnViewModel
    
    private var columns: [GridItem] {
        switch Platform.current {
        case .macOS:
            let allCount = viewModel.questionsBase.count
            let count = (10...16).contains(allCount) ? 2 : max(1, Int(ceil(Double(allCount) / 16)))
            return Array(repeating: GridItem(.flexible(), spacing: 10), count: count)
        default:
            return [GridItem(.flexible())]
        }
    }
    
    let minLength: CGFloat = {
        switch Platform.current {
        case .macOS: return 40
        default: return 10
        }
    }()
    
    var body: some View {
        
        VStack {
            
            Spacer(minLength: minLength)
            
            Text("Försök att komma ihåg %lld uttrycken.".localized(with: viewModel.questionsBase.count))
                .styledSubtitel()
            
            Spacer()
            
            wordGrid
            
            Spacer()
            
            NavigationLink(value: Destination.quiz(viewModel.category)) {
                Text("Continue".localized)
                    .styledButton(.secondary)
            }.buttonStyle(ScaleButtonStyle())
                .padding(.bottom, Platform.current == .macOS ? 60 : 30)
                .padding(.top, Platform.current == .macOS ? 0 : 8)
        }
        .customTitle(viewModel.category.primaryName.localized)
        .background( GradientBackground().ignoresSafeArea())
    }

    private var wordGrid: some View {
        VStack(alignment: .center) {
            ScrollView {
                ZStack {
                    Spacer().containerRelativeFrame([.vertical])
                    
                    VStack {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            ForEach(viewModel.questionsBase, id: \.id) { question in
                                HStack(alignment: .center) {
                                    Text(question.expression)
                                        .styledText(color: .blue)
                                    Text("–")
                                        .styledText(color: .gray)
                                    Text((question.translations[viewModel.settings.primaryLanguage.rawValue]
                                          ?? question.translations[Language.english.rawValue])!)
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
