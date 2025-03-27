//
//  AlphabetView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct AlphabetView: View {
        
    @StateObject var viewModel: AlphabetViewModel

    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 6)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.letters, id: \.self) { letterPair in
                    Button(action: {
                        viewModel.speakLetter(letterPair)
                    }) {
                        Text(letterPair)
                            .frame(width: 100, height: 100)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
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
        .navigationTitle("Alphabet")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground().ignoresSafeArea())
    }
}
