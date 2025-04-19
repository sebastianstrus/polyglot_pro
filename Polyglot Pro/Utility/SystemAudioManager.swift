//
//  SystemAudioManager.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-19.
//

#if os(macOS)
import Foundation
import CoreAudio
import AudioToolbox

final class SystemAudioManager {
    
    static let shared = SystemAudioManager()
    
    private init() {}
    
    /// Returns the current system output volume (0.0 - 1.0), or -1 if an error occurs
    func getSystemOutputVolume() -> Float32 {
        var defaultOutputDeviceID = AudioObjectID(kAudioObjectUnknown)
        var propertySize = UInt32(MemoryLayout<AudioObjectID>.size)

        var defaultOutputDevicePropertyAddress = AudioObjectPropertyAddress(
            mSelector: kAudioHardwarePropertyDefaultOutputDevice,
            mScope: kAudioObjectPropertyScopeGlobal,
            mElement: kAudioObjectPropertyElementMain
        )

        let status = AudioObjectGetPropertyData(
            AudioObjectID(kAudioObjectSystemObject),
            &defaultOutputDevicePropertyAddress,
            0,
            nil,
            &propertySize,
            &defaultOutputDeviceID
        )

        if status != noErr {
            print("Error getting default output device: \(status)")
            return -1
        }

        var volume: Float32 = 0
        propertySize = UInt32(MemoryLayout<Float32>.size)

        var volumePropertyAddress = AudioObjectPropertyAddress(
            mSelector: kAudioDevicePropertyVolumeScalar,
            mScope: kAudioDevicePropertyScopeOutput,
            mElement: 0 // Use 1 if you want the right channel
        )

        let volumeStatus = AudioObjectGetPropertyData(
            defaultOutputDeviceID,
            &volumePropertyAddress,
            0,
            nil,
            &propertySize,
            &volume
        )

        if volumeStatus != noErr {
            print("Error getting volume: \(volumeStatus)")
            return -1
        }

        return volume
    }
    
    /// Returns true if the system output is muted, false otherwise
    func isSystemOutputMuted() -> Bool {
        var defaultOutputDeviceID = AudioObjectID(kAudioObjectUnknown)
        var propertySize = UInt32(MemoryLayout<AudioObjectID>.size)

        var defaultOutputDevicePropertyAddress = AudioObjectPropertyAddress(
            mSelector: kAudioHardwarePropertyDefaultOutputDevice,
            mScope: kAudioObjectPropertyScopeGlobal,
            mElement: kAudioObjectPropertyElementMain
        )

        let status = AudioObjectGetPropertyData(
            AudioObjectID(kAudioObjectSystemObject),
            &defaultOutputDevicePropertyAddress,
            0,
            nil,
            &propertySize,
            &defaultOutputDeviceID
        )

        if status != noErr {
            print("Error getting default output device: \(status)")
            return false
        }

        var isMuted: UInt32 = 0
        propertySize = UInt32(MemoryLayout<UInt32>.size)

        var mutePropertyAddress = AudioObjectPropertyAddress(
            mSelector: kAudioDevicePropertyMute,
            mScope: kAudioDevicePropertyScopeOutput,
            mElement: 0 // Use 1 if you want right channel
        )

        let muteStatus = AudioObjectGetPropertyData(
            defaultOutputDeviceID,
            &mutePropertyAddress,
            0,
            nil,
            &propertySize,
            &isMuted
        )

        if muteStatus != noErr {
            print("Error getting mute status: \(muteStatus)")
            return false
        }

        return isMuted != 0
    }

}
#endif
