//
//  ContentView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

struct VocabularyView: View {
    
    @EnvironmentObject var settings: SettingsManager
    
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
    
    var body: some View {
        
        VStack {
            
            ScrollView(.vertical, showsIndicators: true) {
                Text("").frame(height: 10)
                LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                    ForEach(Category.allCases, id: \ .self) { category in
                        
                        NavigationLink(value: category) {
                            VStack {
                                Text(category.displayName(for: settings.targetLanguage))
                                    .foregroundColor(.white)
                                    .font(.system(size: btnFontSize, weight: .bold))
                                Text("(\(category.displayName(for: settings.primaryLanguage!)))")
                                    .foregroundColor(.white.opacity(0.8))
                                    .font(.system(size: btnFontSize2 - 2, weight: .regular))
                            }
                                .frame(width: btnWidth, height: btnHeight)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                
                                .cornerRadius(radius)
                                .shadow(color: Color.blue.opacity(0.4), radius: radius, x: 0, y: 5)
                            
                        }.buttonStyle(ScaleButtonStyle())
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                .navigationDestination(for: Category.self) { category in
                    LearnView(viewModel: LearnViewModel(settings: settings, category: category))
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




