//
//  SpeechController.swift
//  SeeSpeech
//
//  Created by Susan Kern on 7/13/18.
//  Copyright © 2018 SKern. All rights reserved.
//
//  This functionality has been adapted from Ray Wenderlich's tutorial on Speech Recognition:  https://www.raywenderlich.com/155752/speech-recognition-tutorial-ios.
//

import Foundation
import AVFoundation
import Speech

final class SpeechController {
    
    // MARK: Private variables
    
    private let audioEngine = AVAudioEngine()  // Used for complex audio processing
    private let speechRecognizer = SFSpeechRecognizer()
    private let request = SFSpeechAudioBufferRecognitionRequest()
    private var recognitionTask: SFSpeechRecognitionTask?   // Use to monitor progress of speech recognition task
    private var mostRecentlyProcessedSegmentDuration: TimeInterval = 0

    
    // MARK: Initialization
    
    init() {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        
        // Create "recording tap" on input node
        node.installTap(onBus: 0, 
                        bufferSize: 1024,
                        format: recordingFormat) { [unowned self]
                            (buffer, _) in
                            self.request.append(buffer) // Append to end of recording buffer
        }
        
        audioEngine.prepare()  // Prepare for recording, allocate necessary resources
    }
    
    
    // MARK: Public functions

    func requestAuthorization(completion: @escaping (Bool) -> ()) {
        SFSpeechRecognizer.requestAuthorization {
            (status) in
            switch status {
            case .authorized:
                log.info("Successfully requested speech recognition authorization")
                completion(true)
            case .denied:
                log.error("Speech recognition authorization denied")
                completion(false)
            case .restricted:
                log.error("Speech recognition authorization failed, reason: Not available on this device")
                completion(false)
            case .notDetermined:
                log.error("Speech recognition authorization failed, reason: Not determined")
                completion(false)
            }
        } 
    }
    
    func startRecording(completion: @escaping (String) -> ()) throws {
        mostRecentlyProcessedSegmentDuration = 0
        
        try audioEngine.start()
        recognitionTask = speechRecognizer?.recognitionTask(with: request) {
            [unowned self]
            (result, _) in
            if let transcription = result?.bestTranscription {  // use transcription with highest confidence level
                completion(transcription.formattedString)
                
                if let lastSegment = transcription.segments.last,
                    lastSegment.duration > self.mostRecentlyProcessedSegmentDuration {
                    self.mostRecentlyProcessedSegmentDuration = lastSegment.duration  // Each new segment is appended to end of previous transcription
                }
            }
        }
    }
    
    func stopRecording() {
        audioEngine.stop()
        request.endAudio()
        recognitionTask?.cancel()
    }
}
