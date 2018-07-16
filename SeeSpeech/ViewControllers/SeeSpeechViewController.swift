//
//  SeeSpeechViewController.swift
//  SeeSpeech
//
//  Created by Susan Kern on 7/13/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import AVFoundation
import Speech
import UIKit

final class SeeSpeechViewController: UIViewController {  
    
    // MARK: Private variables
    var timer = Timer()
    
    
    // MARK: IBOutlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var buttonTalk: SAKButton!
    @IBOutlet weak var buttonClear: SAKButton!
    

    // MARK: View life-cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        activityIndicator.startAnimating()
        buttonTalk.isEnabled = false
        buttonClear.isEnabled = false
        
        SpeechController.sharedInstance.requestAuthorization(completion: { [unowned self] (authorized) -> Void in
            DispatchQueue.main.async{
                if authorized {
                        self.activityIndicator.stopAnimating()
                        self.buttonTalk.isEnabled = true
                        self.buttonClear.isEnabled = false
                } else {
                    self.activityIndicator.stopAnimating()
                    self.buttonTalk.isEnabled = false
                    self.buttonClear.isEnabled = false
                    
                    // TODO: Alert user of failure
                }
            }
        })
    }
    
    
    // MARK: IBActions
    
    @IBAction func tappedButtonTalk(_ sender: Any) {
        DispatchQueue.main.async{
            self.textView.text = ""
            self.buttonTalk.isEnabled = false
            self.buttonClear.isEnabled = true
        }
        
        startRecording()
    }
    
    @IBAction func tappedButtonClear(_ sender: Any) {
        stopRecording()
        
        DispatchQueue.main.async{
            self.textView.text = ""
            self.buttonTalk.isEnabled = true
            self.buttonClear.isEnabled = false
        }
    }


    // MARK: Private functions
    
    private func startRecording() {
        // TODO: Start 1 minute timer
        
        do {
            try SpeechController.sharedInstance.startRecording(completion: { [unowned self] (text) -> Void in
                self.updateUIWithText(text)
            })
        } catch let error {
            log.error("Error starting recording: \(error.localizedDescription)")
        } 
    }
    
    private func stopRecording() {
        SpeechController.sharedInstance.stopRecording()
    }
    
    private func updateUIWithText(_ text: String) {
        DispatchQueue.main.async {
            self.textView.text = text
            self.textView.scrollToBottom()
        }
    }
}
