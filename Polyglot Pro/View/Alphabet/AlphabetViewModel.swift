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
import CoreAudio
import AudioToolbox

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
#if os(iOS)
        let currentVolume = AVAudioSession.sharedInstance().outputVolume
        let isSilent = currentVolume <= 0.01
#else
        let audioManager = SystemAudioManager.shared
        let currentVolume = audioManager.getSystemOutputVolume()
        let isSilent = audioManager.isSystemOutputMuted() || currentVolume <= 0.01
#endif
        
        if isSilent {
            print("TEST100 silent")
            mutedPublisher.send()
            return
        }
        
#if os(iOS)
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("AVAudioSession error: \(error.localizedDescription)")
        }
#endif
        
        let letter = String(letterPair.suffix(1))
        synthesizer.stopSpeaking(at: .immediate)

        let utterance = AVSpeechUtterance(string: letter)
        if let targetLanguage = settings.targetLanguage {
            utterance.voice = AVSpeechSynthesisVoice(language: targetLanguage.languageTag)
        }

        synthesizer.speak(utterance)
    }

    private func observeVolume() {
#if os(iOS)
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setActive(true)
        volumeObserver = audioSession.observe(\.outputVolume, options: [.new]) { _, change in
            guard let newVolume = change.newValue else { return }
            print("System volume changed: \(newVolume)")
        }
#endif
    }
    
    
    

//    
//
//    func getSystemOutputVolume() -> Float32 {
//        var defaultOutputDeviceID = AudioObjectID(kAudioObjectUnknown)
//        var propertySize = UInt32(MemoryLayout<AudioObjectID>.size)
//
//        var defaultOutputDevicePropertyAddress = AudioObjectPropertyAddress(
//            mSelector: kAudioHardwarePropertyDefaultOutputDevice,
//            mScope: kAudioObjectPropertyScopeGlobal,
//            mElement: kAudioObjectPropertyElementMain
//        )
//
//        let status = AudioObjectGetPropertyData(
//            AudioObjectID(kAudioObjectSystemObject),
//            &defaultOutputDevicePropertyAddress,
//            0,
//            nil,
//            &propertySize,
//            &defaultOutputDeviceID
//        )
//
//        if status != noErr {
//            print("Error getting default output device: \(status)")
//            return -1
//        }
//
//        var volume: Float32 = 0
//        propertySize = UInt32(MemoryLayout<Float32>.size)
//
//        // ✅ Make this variable instead of constant
//        var volumePropertyAddress = AudioObjectPropertyAddress(
//            mSelector: kAudioDevicePropertyVolumeScalar,
//            mScope: kAudioDevicePropertyScopeOutput,
//            mElement: 0 // try 1 as well for stereo if needed
//        )
//
//        let volumeStatus = AudioObjectGetPropertyData(
//            defaultOutputDeviceID,
//            &volumePropertyAddress,
//            0,
//            nil,
//            &propertySize,
//            &volume
//        )
//
//        if volumeStatus != noErr {
//            print("Error getting volume: \(volumeStatus)")
//            return -1
//        }
//
//        return volume // value between 0.0 and 1.0
//    }

}
