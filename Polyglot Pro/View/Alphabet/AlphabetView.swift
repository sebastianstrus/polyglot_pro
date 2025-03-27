//
//  AlphabetView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct AlphabetView: View {
    
    let size: CGFloat = {
        switch Platform.current {
        case .macOS: return 100
        default: return 56
        }
    }()
    
    let fontSize: CGFloat = {
        switch Platform.current {
        case .macOS: return 40
        default: return 22
        }
    }()
    
    let cornerRadius: CGFloat = {
        switch Platform.current {
        case .macOS: return 12
        default: return 6
        }
    }()
        
    @StateObject var viewModel: AlphabetViewModel

    //let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 6)
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: Platform.current == .iOS ? 4 : 6)

    var body: some View {
        ScrollView {
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
