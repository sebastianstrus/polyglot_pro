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
    @Published var isSoundOn: Bool = SettingsManager.shared.isSoundOn
    
    @Published var speechRate: Double = SettingsManager.shared.speechRate {
        didSet {
            SettingsManager.shared.speechRate = speechRate
        }
    }
    
    
//    @Published var speechRate: Float {
//        didSet {
//            UserDefaults.standard.set(speechRate, forKey: "speechRate")
//        }
//    }
    
    var category: Category
    private var speechSynthesizer = AVSpeechSynthesizer()
    
    init(category: Category) {
        self.category = category
//        self.questionsBase = DataProvider2.questions(for: category)
//        self.questions = DataProvider.questions(for: category).shuffled()
        
        self.questionsBase = DataProviderStruct.data[category] ?? []
        self.questions = (DataProviderStruct.data[category] ?? []).shuffled()
        
    }
    
    func toggleSound() {
        SettingsManager.shared.isSoundOn.toggle()
        isSoundOn = SettingsManager.shared.isSoundOn
    }
    
    func checkAnswer() -> Bool? {
        guard !userInput.isEmpty else { return nil }
        isCorrect = userInput.lowercased() == questions[currentIndex].expression.lowercased()
        
        if isCorrect == true {
            if isSoundOn {
                speak(text: questions[currentIndex].expression)
            }
        } else {
            if !missCountUpdated {
                missCount = missCount + 1
                missCountUpdated = true
            }
            
            shakeTextField()
        }
        return isCorrect
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
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "sv-SE")
        utterance.rate = Float(speechRate)
        speechSynthesizer.speak(utterance)
        
    }
}
