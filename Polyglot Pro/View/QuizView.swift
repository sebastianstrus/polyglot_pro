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
    @FocusState private var isTextFieldFocused: Bool
    
    let hintFontSize: CGFloat = {
        switch Platform.current {
        case .macOS: return 24
        default: return 20
        }
    }()
    
    let lineWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 5
        default: return 3
        }
    }()
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                HStack() {
                    Button(action: {
                        showMenu = true
                    }) {
                        Text("Tillbaka")
                            .styledButton()
                    }.buttonStyle(ScaleButtonStyle())
                    
                    if Platform.current == .macOS {
                        Text("\(viewModel.currentIndex + 1)/\(viewModel.questions.count)")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.purple)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Text(viewModel.missCount > 0 ? "Fel: \(viewModel.missCount)" : "")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(.red)
                        .padding(.trailing, 16)
                    
                    if Platform.current == .macOS {
                        
                        Button(action: {
                            viewModel.toggleSound()
                        }) {
                            Image(systemName: viewModel.isSoundOn ? "speaker.wave.2.fill" : "speaker.slash.fill")
                                .styledButton()
                        }.buttonStyle(ScaleButtonStyle())
                        
                        Slider(value: $viewModel.speechRate, in: 0.1...0.6, step: 0.1)
                            .styledSlider()
                    }
                }
                
                Text(viewModel.category.rawValue)
                    .styledTitel()
            }
            .padding()
            .padding(.top, 4)
            
            Text(viewModel.questions[viewModel.currentIndex].expression)
                .styledTitel()
                .padding()
            
            Text(viewModel.questions[viewModel.currentIndex].translation)
                .font(.system(size: hintFontSize, weight: .regular, design: .rounded))
                .foregroundColor(.red)
                .padding()
                .opacity(viewModel.showHint ? 1 : 0)

            CustomTextField("Ange översättning", text: $viewModel.userInput, isCorrect: $viewModel.isCorrect, onCommit: {
                print("TEST100 onCommit")
                if viewModel.isCorrect == true {
                    viewModel.nextQuestion()
                    isTextFieldFocused = true
                } else {
                    if let isCorrect = viewModel.checkAnswer() {
                        print("TEST100 isCorrect: \(isCorrect)")
                        if Platform.current != Platform.macOS {
                            isTextFieldFocused = !isCorrect
                        }
                    }
                }
            })
            .styledTextField(isCorrect: viewModel.isCorrect, shake: viewModel.shake)
            .focused($isTextFieldFocused)

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
                    print("TEST100 buttonClicked")
                    if viewModel.isCorrect == true {
                        viewModel.nextQuestion()
                        isTextFieldFocused = true
                    } else {
                        if let isCorrect = viewModel.checkAnswer() {
                            print("TEST100 isCorrect: \(isCorrect)")
                            if Platform.current != Platform.macOS {
                                isTextFieldFocused = !isCorrect
                            }
                        }
                    }
                }) {
                    Text(viewModel.isCorrect == true ? "Next" : "Check")
                        .styledButton(.secondary)
                }.buttonStyle(ScaleButtonStyle())
                
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
    }
}
