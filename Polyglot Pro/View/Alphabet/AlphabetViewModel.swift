//
//  AlphabetViewModel.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-27.
//

import SwiftUI
import AVFoundation
import Combine
import MediaPlayer

class AlphabetViewModel: NSObject, ObservableObject {
    
    var settings: SettingsManager
    @Published var letters: [String]

    let player: AVPlayer
    private let synthesizer = AVSpeechSynthesizer()
    private var cancellables = Set<AnyCancellable>()
    
    private var volumeObserver: NSKeyValueObservation?

    init(settings: SettingsManager) {
        self.settings = settings
        self.letters = settings.targetLanguage?.letters ?? []
        self.player = AVPlayer()
        super.init()
        observeVolume()
    }

    deinit {
        volumeObserver?.invalidate()
    }
    
    let mutedPublisher = PassthroughSubject<Void, Never>()

    func speakLetter(_ letterPair: String) {
        let currentVolume = AVAudioSession.sharedInstance().outputVolume

        if currentVolume <= 0.01 {
            print("TEST100 silent")
            mutedPublisher.send()
            return
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("AVAudioSession error: \(error.localizedDescription)")
        }

        let letter = String(letterPair.suffix(1))
        synthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(string: letter)
        if let targetLanguage = settings.targetLanguage {
            utterance.voice = AVSpeechSynthesisVoice(language: targetLanguage.languageTag)
        }

        synthesizer.speak(utterance)
    }

    private func observeVolume() {
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setActive(true)
        volumeObserver = audioSession.observe(\.outputVolume, options: [.new]) { _, change in
            guard let newVolume = change.newValue else { return }
            print("System volume changed: \(newVolume)")
        }
    }
}
