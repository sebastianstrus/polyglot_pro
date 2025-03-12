//
//  ExamplesView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct ExamplesView: View {
    let examples: [(String, String)]
    @ObservedObject var viewModel: LearnViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Examples:")
                .font(.title)
                .padding(.horizontal)
            
            ForEach(viewModel.questions[viewModel.currentIndex].examples, id: \ .swedish) { example in
                HStack {
                    Button(action: {
                        viewModel.speak(text: example.swedish)
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .frame(width: 50, height: 25)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(6)
                            
                    }.buttonStyle(ScaleButtonStyle())
                    
                    Text(example.swedish)
                        .font(.title)
                    Spacer()
                    Text(example.ukrainian)
                        .font(.title)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
            }
        }
        .padding(10)
        .frame(width: 1000, height: 230)
        .background(.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 5)
                .shadow(color: .purple.opacity(0.5), radius: 10)
        )
    }
}

