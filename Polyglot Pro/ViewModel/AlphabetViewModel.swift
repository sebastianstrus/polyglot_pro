//
//  AlphabetViewModel.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-27.
//

import SwiftUI
import AVFoundation

class AlphabetViewModel: ObservableObject {
    
    var settings: SettingsManager
    
    @Published var letters: [String]
    
    init(settings: SettingsManager) {
        self.settings = settings
        self.letters = settings.targetLanguage.letters
    }

    private let synthesizer = AVSpeechSynthesizer()

    func speakLetter(_ letterPair: String) {
        let letter = String(letterPair.suffix(1)) // Extract lowercase letter
        synthesizer.stopSpeaking(at: .immediate)
        
        let utterance = AVSpeechUtterance(string: letter)
        utterance.voice = AVSpeechSynthesisVoice(language: "sv-SE")
        
        synthesizer.speak(utterance)
    }
}
