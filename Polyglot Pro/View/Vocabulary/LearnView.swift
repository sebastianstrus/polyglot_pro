//
//  LearnView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct LearnView: View {
    @ObservedObject var viewModel: LearnViewModel
    @EnvironmentObject var settings: SettingsManager
    
    private var columns: [GridItem] {
        switch Platform.current {
        case .macOS:
            let allCount = viewModel.questionsBase.count
            let count = (10...16).contains(allCount) ? 2 : max(1, Int(ceil(Double(allCount) / 16)))
            return Array(repeating: GridItem(.flexible(), spacing: 20), count: count)
        default:
            return [GridItem(.flexible())]
        }
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.ultraThinMaterial)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    .padding(.horizontal, 1)
            )
            .shadow(color: .black.opacity(0.1), radius: 3, x: 2, y: 2)
        
            
    }
    
    let minLength: CGFloat = {
        switch Platform.current {
        case .macOS: return 60
        default: return 20
        }
    }()
    
    var body: some View {
        ZStack {
            GradientBackground().ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer(minLength: minLength)
                
                // Header
                VStack(spacing: 8) {
                    Text("Learn \(viewModel.questionsBase.count) Expressions")
                        .font(.title2)
                        .fontWeight(.semibold)
//                        .foregroundStyle(.primary)
                        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                    
                    Text("Try to memorize these words and phrases")
                        .font(.subheadline)
//                        .foregroundStyle(.secondary)
                        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                }
                .padding(.bottom, 24)
                
                // Word Grid
                wordGrid
                    .padding(.horizontal, Platform.current == .macOS ? 40 : 16)
                
                Spacer()
                
                NavigationLink(destination: QuizView(viewModel: viewModel)) {
                    Text("Continue".localized)
                        .styledButton(.secondary)
                }.buttonStyle(ScaleButtonStyle())
                    .padding(.bottom, 8)
            }
        }
        .customTitle(viewModel.category.primaryName.localized)
    }

    private var wordGrid: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(viewModel.questionsBase, id: \.id) { question in
                    HStack(alignment: .center, spacing: 8) {
                        
                        Spacer()
                        
                        Text(question.expression)
                            .font(.body.weight(.medium))
                            .foregroundColor(.blue)
                        
                        Text("–")
                            .foregroundColor(.gray)
                        
                        Text((question.translations[viewModel.settings.primaryLanguage.rawValue]
                              ?? question.translations[Language.english.rawValue])!)
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(cardBackground)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(.vertical, 8)
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}
