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
    @Published private(set) var questionsBase: [Question] = []
    @Published private(set) var questions: [Question] = []
    
    @Published var currentIndex = 0
    @Published var missCount = 0
    @Published var userInput = ""
    @Published var isCorrect: Bool? = nil
    @Published var showHint = false
    
    @Published var speechRate: Float {
            didSet {
                UserDefaults.standard.set(speechRate, forKey: "speechRate")
            }
        }
    
    var category: QuestionCategory
    private var speechSynthesizer = AVSpeechSynthesizer()
    
    init(category: QuestionCategory) {
        self.category = category
        self.questionsBase = DataProvider.questions(for: category)
        self.questions = DataProvider.questions(for: category).shuffled()
        self.speechRate = UserDefaults.standard.float(forKey: "speechRate") // Load saved value
                if self.speechRate == 0 { self.speechRate = 0.5 }
    }
    
    func checkAnswer() {
        guard !userInput.isEmpty else { return }
        isCorrect = userInput.lowercased() == questions[currentIndex].translation.lowercased()
        if isCorrect == true {
            speak(text: questions[currentIndex].translation)
        } else {
            missCount = missCount + 1
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
    @State var showWords = true
    
    var columns: [GridItem] {

        let allCount = viewModel.questions.count
        let count = (10...16).contains(allCount) ? 2 : max(1, Int(ceil(Double(allCount) / 16)))
        
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: count)
    }
    
    var body: some View {
        if showWords {
            
            VStack {
                HStack {
                    Button(action: {
                        showWords = false
                        showMenu = true
                    }) {
                        Text("Tillbaka")
                            .font(.title)
                            .frame(width: 100, height: 50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                            .padding()
                    }
                    
                    .buttonStyle(ScaleButtonStyle())
                    
                    Spacer()
                    
                    Text("\(viewModel.category.rawValue)")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                        .padding(.top, 40)
                        .padding(.bottom, 6)
                    
                    Spacer()
                    
                    Text("")
                        .frame(width: 100)
                        .padding()
                }
                
                
                
                Text("Försök att komma ihåg uttrycken.")
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                
                
                Spacer()
                
//               ScrollView {
                    VStack(alignment: .center) {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            
                            ForEach(viewModel.questionsBase, id: \.expression) { question in
                                HStack(alignment: .center) {
                                    
                                    Text("\(question.translation)")
                                        .font(.system(size: 22, weight: .bold, design: .rounded))
                                        .foregroundColor(.blue)

                                    Text("–")
                                        .font(.system(size: 22, weight: .bold, design: .rounded))
                                        .foregroundColor(.gray)
                                    
                                    Text("\(question.expression)")
                                        .font(.system(size: 22, weight: .bold, design: .rounded))
                                        .foregroundColor(.purple)
                                    
                                }.padding(.horizontal)
                            }
                        }.frame(maxWidth: .infinity)
                    }.frame(maxWidth: .infinity)
                    .padding()
//                }
                
                
                Spacer()
                
                HStack {
                    Button(action: {
                        showWords = false
                    }) {
                        Text("Start")
                            .font(.title)
                            .frame(width: 100, height: 50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                            .padding()
                    }.buttonStyle(ScaleButtonStyle())
                        
                    
                }.padding(.bottom, 80)
                
            }
            .frame(minWidth:1100, maxWidth: .infinity, minHeight: 800, maxHeight: .infinity)
            .background(
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]),
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .ignoresSafeArea()
            
        } else {
            VStack(spacing: 20) {
                
                HStack {
                    
                    HStack {
                        Button(action: {
                            showMenu = true
                        }) {
                            Text("Tillbaka")
                                .font(.title)
                                .frame(width: 100, height: 50)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                                .padding()
                        }
                        
                        .buttonStyle(ScaleButtonStyle())
                        
                        Text("\(viewModel.currentIndex + 1)/\(viewModel.questions.count)")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.purple)
                            .padding()
                        
                        Spacer()
                    }
                    .frame(width: 400)
                    
                    
                    Spacer()
                    
                    Text("\(viewModel.category.rawValue)")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text(viewModel.missCount > 0 ? "Fel: \(viewModel.missCount)" : "")
                            .font(.system(size: 20, weight: .regular, design: .rounded))
                            .foregroundColor(.red)
                            .padding(.trailing, 16)
                            .hidden()

                        
                        Slider(value: $viewModel.speechRate, in: 0.1...0.6, step: 0.1)
                            .frame(width: 100, height: 2)
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color(.white))
                                    .frame(width: 100, height: 4)
                                    .allowsHitTesting(false)
                                
                            )
                        
                            .overlay(
                                
                                HStack(spacing: 0) {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 2, height: 8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 2, height: 8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(Color(.white))
                                        .frame(width: 2, height: 8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(Color(.white))
                                        .frame(width: 2, height: 8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(Color(.white))
                                        .frame(width: 2, height: 8)
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(Color(.white))
                                        .frame(width: 2, height: 8)
                                    
                                }.allowsHitTesting(false)
                                    .frame(width: 94)
                            )
                        
                        
                        
                        
                        
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(12)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                            .accentColor(Color(.white))
                        
                        
                    }.frame(width: 400)
                    
                }
                .padding()
                .padding(.top, 4)
                

                
                
                Text(viewModel.questions[viewModel.currentIndex].expression)
                    .font(.system(size: 60, weight: .bold, design: .rounded)) // Rounded, bold font
                    .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)) // Fun gradient color
                    .padding()
    //                .animation(.spring(response: 0.5, dampingFraction: 0.5), value: viewModel.currentIndex)
                
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
            
            .frame(minWidth:1100, maxWidth: .infinity, minHeight: 800, maxHeight: .infinity)
            .background(
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]),
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .ignoresSafeArea()
        }
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
            VStack {
                
                Text("Poliglot Pro")
                    .font(.system(size: 58, weight: .bold, design: .rounded))
                    .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                    .padding(.top, 46)
                    .padding(.bottom, 6)
                
                Spacer()
                
                LazyVGrid(columns: columns, spacing: 50) {
                    ForEach(QuestionCategory.allCases, id: \ .self) { category in
                        
                        let number = DataProvider.questions(for: category).count
                        Button(action: {
                            selectedCategory = category
                            showMenu = false
                        }) {
                            Text("\(category.rawValue) (\(number))")
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
                        .frame(width: 300, height: 50)
                        .buttonStyle(ScaleButtonStyle())
                        
                        
                    }
                    
                }
                
                Spacer()
                Spacer()
            }
            .frame(minWidth:800, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
            .background(
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]),
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


