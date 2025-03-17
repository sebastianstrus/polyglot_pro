//
//  LearnViewModel.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI
import AVFoundation

class LearnViewModel: ObservableObject {
    
    @Published private(set) var questionsBase: [Question] = []
    @Published private(set) var questions: [Question] = []
    
    @Published var currentIndex = 0
    @Published var missCount = 0
    @Published var userInput = ""
    @Published var isCorrect: Bool? = nil
    @Published var showHint = false
    @Published var shake: Bool = false
    @Published var missCountUpdated: Bool = false
    @Published var isSoundOn = true {
        didSet {
            UserDefaults.standard.set(isSoundOn, forKey: "speechOn")
        }
    }
    
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
        
        self.speechRate = UserDefaults.standard.float(forKey: "speechRate")
        self.isSoundOn = UserDefaults.standard.bool(forKey: "speechOn")
        
        if self.speechRate == 0 { self.speechRate = 0.3 }
    }
    
    func checkAnswer() {
        guard !userInput.isEmpty else { return }
        isCorrect = userInput.lowercased() == questions[currentIndex].translation.lowercased()
        if isCorrect == true {
            if isSoundOn {
                speak(text: questions[currentIndex].translation)
            }
        } else {
            if !missCountUpdated {
                missCount = missCount + 1
                missCountUpdated = true
            }
            
            shakeTextField()
        }
    }
    
    func shakeTextField() {
            withAnimation {
                shake = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.shake = false
            }
        }
    
    func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            DispatchQueue.main.async {
                self.userInput = ""
                self.isCorrect = nil
                self.showHint = false
                self.missCountUpdated = false
            }
        }
    }
    
    func toggleSound() {
        isSoundOn.toggle()
    }
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "sv-SE")
        utterance.rate = speechRate
        speechSynthesizer.speak(utterance)
        
    }
}
