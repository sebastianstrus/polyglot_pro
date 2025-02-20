//
//  ContentView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI
import AVFoundation

struct Question {
    let expression: String
    let translation: String
    let examples: [(swedish: String, ukrainian: String)]
}

class LearnViewModel: ObservableObject {
    @Published private(set) var questions: [Question] = []
    
    @Published var currentIndex = 0
    @Published var userInput = ""
    @Published var isCorrect: Bool? = nil
    @Published var showHint = false
    @Published var speechRate: Float = 0.5
    var category: QuestionCategory
    private var speechSynthesizer = AVSpeechSynthesizer()
    
    init(category: QuestionCategory) {
        self.category = category
        self.questions = DataProvider.questions(for: category)
    }
    
    func checkAnswer() {
        isCorrect = userInput.lowercased() == questions[currentIndex].translation.lowercased()
        if isCorrect == true {
            speak(text: questions[currentIndex].translation)
        }
    }
    
    func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            DispatchQueue.main.async {
                self.userInput = ""
                self.isCorrect = nil
                self.showHint = false
            }
        }
    }
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "sv-SE")
        utterance.rate = speechRate
        speechSynthesizer.speak(utterance)
    }
}


struct LearnView: View {
    @ObservedObject var viewModel: LearnViewModel
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            HStack {
                
                HStack {
                    Button(action: {
                        showMenu = true
                    }) {
                        Text("Back")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                            .frame(width: 100, height: 50)
                    }
                    
                    .buttonStyle(ScaleButtonStyle())
                    .padding(20)
                    
                    Text("\(viewModel.currentIndex + 1)/\(viewModel.questions.count)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                        .padding()
                    
                    Spacer()
                }
                .frame(width: 400)
                
                
                Spacer()
                
                Text("\(viewModel.category.rawValue)")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.purple)
                
                Spacer()
                
                HStack {
                    Text("Talhastighet")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.purple)
                    
                    Slider(value: $viewModel.speechRate, in: 0.1...0.6, step: 0.1)
                        .accentColor(Color.white)
                        .padding()
                        .frame(width: 200)
                        .shadow(color: Color.cyan.opacity(0.7), radius: 10, x: 0, y: 5)
                    
                }.frame(width: 400)
                
            }
            
            

            
            
            Text(viewModel.questions[viewModel.currentIndex].expression)
                .font(.system(size: 60, weight: .bold, design: .rounded)) // Rounded, bold font
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)) // Fun gradient color
                .padding()
                .scaleEffect(1.1) // Slightly larger
                .animation(.spring(response: 0.5, dampingFraction: 0.5), value: viewModel.currentIndex) // Fun bounce effect
            
            Text("\(viewModel.questions[viewModel.currentIndex].translation)")
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
            
            .foregroundColor(viewModel.isCorrect == nil ? Color.gray : (viewModel.isCorrect! ? Color.green : Color.red))
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .frame(width: 600, height: 70)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 5)
                
                    .shadow(color: .purple.opacity(0.5), radius: 10)
            )
            .multilineTextAlignment(.center)
            .textFieldStyle(.plain)
            
            
            HStack {
                
                Button(action: {
                    viewModel.speak(text: viewModel.questions[viewModel.currentIndex].translation)
                }) {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.title)
                        .frame(width: 100, height: 50)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .frame(width: 100, height: 50)
                .buttonStyle(ScaleButtonStyle())
                .padding(10)
                
               
                
                Button(action: {
                    if viewModel.isCorrect == true {
                        viewModel.nextQuestion()
                    } else {
                        viewModel.checkAnswer()
                    }
                }) {
                    Text(viewModel.isCorrect == true ? "Next" : "Check")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                }
                .frame(width: 350, height: 50)
                .buttonStyle(ScaleButtonStyle())
                
                
                Button(action: {
                    viewModel.showHint = true
                }) {
                    Text("Hint")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .cornerRadius(12)
                        .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                }
                
                .buttonStyle(ScaleButtonStyle())
                .padding(10)
                
            }.frame(width: 60, alignment: .center)
            
            
            
            
            
            Spacer()
            
            
            
            
            if viewModel.isCorrect == true {
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
                            }
                            .buttonStyle(ScaleButtonStyle())
                            
                            Text(example.swedish)
                                .font(.title)
                            Spacer()
                            
                            Text(example.ukrainian)
                                .font(.title)
                                .foregroundColor(.gray)
                        }.padding(.horizontal)
                    }
                }
                .padding(10)
                .frame(width: 1000, height: 230)
                .background(.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 5) // Fun gradient border
                    
                        .shadow(color: .purple.opacity(0.5), radius: 10)
                )
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.cyan.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom)
            
            
        )
        .ignoresSafeArea()
    }
}






struct ContentView: View {
    @State private var showMenu = true
    @State private var selectedCategory: QuestionCategory? = nil
    
    let columns = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]
    
    var body: some View {
        if showMenu {
            LazyVGrid(columns: columns, spacing: 50) {
                ForEach(QuestionCategory.allCases, id: \ .self) { category in
                    
                    Button(action: {
                        selectedCategory = category
                        showMenu = false
                    }) {
                        Text(category.rawValue)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                    }
                    .frame(width: 200, height: 50)
                    .buttonStyle(ScaleButtonStyle())
                    
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.cyan.opacity(0.2)]),
                    startPoint: .top,
                    endPoint: .bottom)
                
                
            )
            .ignoresSafeArea()
        } else {
            if let category = selectedCategory {
                LearnView(viewModel: LearnViewModel(category: category), showMenu: $showMenu)
            }
        }
    }
}


struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


