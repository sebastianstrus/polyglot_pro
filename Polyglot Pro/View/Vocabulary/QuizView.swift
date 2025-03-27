//
//  QuizView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct QuizView: View {
    
    @StateObject var viewModel: LearnViewModel
    
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
    
    let width: CGFloat = {
        switch Platform.current {
        case .macOS: return 460
        default: return 300
        }
    }()
    
    var body: some View {
        ZStack {
            ScrollView([]) {
                VStack {
                    ZStack {
                        HStack {
                            Text("\(viewModel.currentIndex + 1)/\(viewModel.questionsBase.count)")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(.purple)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                            if viewModel.missCount > 0 {
                                ZStack {
                                    Image(systemName: "lightbulb.max.fill")
                                        .resizable() // Ensures the image scales properly
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.red)
                                        .opacity(0.9)
                                    
                                    Text("\(viewModel.missCount)")
                                        .font(.system(size: 12, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 4)
                                }.frame(width: 40, height: 40)
                            }

                            Button(action: {
                                viewModel.toggleSound()
                            }) {
                                Image(systemName: viewModel.isSoundOn ? "speaker.wave.2.fill" : "speaker.slash.fill")
                                    .styledButton(isIcon: true)
                            }.buttonStyle(ScaleButtonStyle())
                            
                            if Platform.current == .macOS {
                                Slider(value: $viewModel.speechRate, in: 0.1...0.6, step: 0.1)
                                    .styledSlider()
                            }
                        }
                        .styledTitel()
                    }
                    .padding()
                    .padding(.top, 4)
                    
                    Text(viewModel.questions[viewModel.currentIndex].translations[viewModel.settings.primaryLanguage!.rawValue]!)
                        .styledTitel()
                        .padding()
                    
                    Text(viewModel.questions[viewModel.currentIndex].expression)
                        .font(.system(size: hintFontSize, weight: .regular, design: .rounded))
                        .foregroundColor(.red)
                        .opacity(0.9)
                        .padding()
                        .opacity(viewModel.showHint ? 1 : 0)
                    
                    CustomTextField("Enter translation".localized, text: $viewModel.userInput, isCorrect: $viewModel.isCorrect, onCommit: {
                        if viewModel.isCorrect == true {
                            viewModel.nextQuestion()
                            isTextFieldFocused = true
                        } else {
                            if let isCorrect = viewModel.checkAnswer() {
                                if Platform.current != Platform.macOS {
                                    isTextFieldFocused = !isCorrect
                                }
                            }
                        }
                    })
                    .styledTextField(isCorrect: viewModel.isCorrect, shake: viewModel.shake)
                    .focused($isTextFieldFocused)
                    .padding(.bottom, 8)
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            viewModel.speak(text: viewModel.questions[viewModel.currentIndex].expression)
                            if !viewModel.missCountUpdated {
                                viewModel.missCount += 1
                                viewModel.missCountUpdated = true
                            }
                        }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .styledButton(isIcon: true)
                        }.buttonStyle(ScaleButtonStyle())
                        
                        Spacer()
                        
                        Button(action: {
                            if viewModel.isCorrect == true {
                                viewModel.nextQuestion()
                                isTextFieldFocused = true
                            } else {
                                if let isCorrect = viewModel.checkAnswer() {
                                    if Platform.current != Platform.macOS {
                                        isTextFieldFocused = !isCorrect
                                    }
                                }
                            }
                        }) {
                            Text(viewModel.isCorrect == true ? "Next".localized : "Check".localized)
                                .styledButton(.secondary)
                        }.buttonStyle(ScaleButtonStyle())
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.showHint = true
                            if !viewModel.missCountUpdated {
                                viewModel.missCount += 1
                                viewModel.missCountUpdated = true
                            }
                        }) {
                            Image(systemName: "lightbulb.max.fill")
                                .styledButton(isIcon: true)
                        }.buttonStyle(ScaleButtonStyle())
                    }
                    .frame(width: width, alignment: .center)
                    
                    Spacer()
                    
                    if viewModel.isCorrect == true {
                        ExamplesView(examples: viewModel.questions[viewModel.currentIndex].examples, viewModel: viewModel)
                    }
                    
                    Spacer()
                }
                .scrollDismissesKeyboard(.interactively)
            }.background ( GradientBackground().ignoresSafeArea() )
                .ignoresSafeArea(.keyboard)
            
            if viewModel.completedCategory  {
                ConfettiView()
            }
        }.customTitle(viewModel.category.rawValue)
    }
}
