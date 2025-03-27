//
//  AlphabetView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct AlphabetView: View {
    
    @StateObject var viewModel: AlphabetViewModel
    
    let size: CGFloat = {
        switch Platform.current {
        case .macOS: return 100
        case .iPadOS: return 100
        default: return 56
        }
    }()
    
    let fontSize: CGFloat = {
        switch Platform.current {
        case .macOS: return 40
        case .iPadOS: return 40
        default: return 22
        }
    }()
    
    let cornerRadius: CGFloat = {
        switch Platform.current {
        case .macOS: return 12
        default: return 6
        }
    }()
    
    let paddingTop: CGFloat = {
        switch Platform.current {
        case .macOS: return 40
        default: return 20
        }
    }()
    
    let columns: [GridItem] = {
        let count: Int
        switch Platform.current {
        case .iOS: count = 4
        case .iPadOS: count = 5
        case .macOS: count = 6
        case .unknown: count = 4
        }
        
        return Array(repeating: GridItem(.flexible(), spacing: 0), count: count)
    }()

    var body: some View {
        ScrollView {
            
            Text("").frame(height: paddingTop)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.letters, id: \.self) { letterPair in
                    Button(action: {
                        viewModel.speakLetter(letterPair)
                    }) {
                        Text(letterPair)
                            .frame(width: size, height: size)
                            .font(.system(size: fontSize, weight: .bold, design: .rounded))
                            .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(
                                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                                    .shadow(color: .purple.opacity(0.5), radius: 10)
                            )
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
            }
            .padding()
        }
        .customTitle("Alphabet")

        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground().ignoresSafeArea())
    }
}
