//
//  QuizView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: LearnViewModel
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                HStack {
                    Button(action: {
                        showMenu = true
                    }) {
                        Text("Tillbaka")
                            .styledButton()
                    }.buttonStyle(ScaleButtonStyle())
                    
                    Text("\(viewModel.currentIndex + 1)/\(viewModel.questions.count)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                        .padding()
                    
                    Spacer()
                }
                .frame(width: 400)
                
                Spacer()
                
                Text(viewModel.category.rawValue)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Text(viewModel.missCount > 0 ? "Fel: \(viewModel.missCount)" : "")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(.red)
                        .padding(.trailing, 16)
                    
                    Button(action: {
                        viewModel.toggleSound()
                    }) {
                        Image(systemName: viewModel.isSoundOn ? "speaker.wave.2.fill" : "speaker.slash.fill")
                            .styledButton()
                    }.buttonStyle(ScaleButtonStyle())
                    
                    Slider(value: $viewModel.speechRate, in: 0.1...0.6, step: 0.1)
                        .styledSlider()
                }
                .frame(width: 400)
            }
            .padding()
            .padding(.top, 4)
            
            Text(viewModel.questions[viewModel.currentIndex].expression)
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                .padding()
            
            Text(viewModel.questions[viewModel.currentIndex].translation)
                .font(.system(size: 24, weight: .regular, design: .rounded))
                .foregroundColor(.red)
                .padding()
                .opacity(viewModel.showHint ? 1 : 0)
            
            TextField("Ange översättning", text: $viewModel.userInput, onCommit: {
                if viewModel.isCorrect == nil || viewModel.isCorrect == false {
                    viewModel.checkAnswer()
                } else {
                    viewModel.nextQuestion()
                }
            })
            .styledTextField(isCorrect: viewModel.isCorrect, shake: viewModel.shake)
            
            HStack {
                Button(action: {
                    viewModel.speak(text: viewModel.questions[viewModel.currentIndex].translation)
                    if !viewModel.missCountUpdated {
                        viewModel.missCount += 1
                        viewModel.missCountUpdated = true
                    }
                }) {
                    Image(systemName: "speaker.wave.2.fill")
                        .styledButton()
                }.buttonStyle(ScaleButtonStyle())
                .padding(10)
                
                Button(action: {
                    if viewModel.isCorrect == true {
                        viewModel.nextQuestion()
                    } else {
                        viewModel.checkAnswer()
                    }
                }) {
                    Text(viewModel.isCorrect == true ? "Next" : "Check")
                        .styledButton()
                }.buttonStyle(ScaleButtonStyle())
                .frame(width: 350, height: 50)
                
                Button(action: {
                    viewModel.showHint = true
                    if !viewModel.missCountUpdated {
                        viewModel.missCount += 1
                        viewModel.missCountUpdated = true
                    }
                }) {
                    Text("Hint")
                        .styledButton()
                }.buttonStyle(ScaleButtonStyle())
                .padding(10)
            }
            .frame(width: 60, alignment: .center)
            
            Spacer()
            
            if viewModel.isCorrect == true {
                ExamplesView(examples: viewModel.questions[viewModel.currentIndex].examples, viewModel: viewModel)
            }
            
            Spacer()
        }
        .frame(minWidth: 1100, maxWidth: .infinity, minHeight: 800, maxHeight: .infinity)
    }
}
