//
//  LearnViewModel.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI
import AVFoundation

class LearnViewModel: ObservableObject {
    
    var settings: SettingsManager
    
    @Published private(set) var questionsBase: [Question] = []
    @Published private(set) var questions: [Question] = []
    
    @Published var currentIndex = 0
    @Published var missCount = 0
    @Published var userInput = ""
    @Published var isCorrect: Bool? = nil
    @Published var showHint = false
    @Published var shake: Bool = false
    @Published var missCountUpdated: Bool = false
    @Published var isSoundOn: Bool
    
    @Published var speechRate: Double {
        didSet {
            settings.speechRate = speechRate
        }
    }

    var category: Category
    
    var completedCategory: Bool {
        let completed = questions.count == currentIndex + 1 && missCount == 0 && isCorrect == true
        
        if completed {
            settings.markCategoryAsCompleted(category)
        }
        
        return completed
    }
    
    private var speechSynthesizer = AVSpeechSynthesizer()
    
    init(settings: SettingsManager, category: Category) {
        self.settings = settings
        self.isSoundOn = self.settings.isSoundOn
        self.speechRate = settings.speechRate
        self.category = category
        self.questionsBase = DataProvider.data[category] ?? []
        self.questions = (DataProvider.data[category] ?? []).shuffled()
    }
    
    func toggleSound() {
        settings.isSoundOn.toggle()
        isSoundOn = settings.isSoundOn
    }
    
    func checkAnswer() -> Bool? {
        guard !userInput.isEmpty else { return nil }
        isCorrect = userInput.lowercased() == questions[currentIndex].expression.lowercased()
        
        if isCorrect == true {
            if isSoundOn {
                speak(text: questions[currentIndex].expression)
            }
        } else {
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
