//
//  PlaySoundsViewController.swift
//  PitchRecorder
//
//  Created by Erick Lara on 9/30/20.
//  Copyright © 2020 mobilestud.io. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: - Class Variables
    var recordedAudioUrl: URL!
    //var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, highPitch, lowPitch, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    
    // MARK: - Actions functions
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
        switch (ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.83)
        case .highPitch:
            playSound(pitch: 933)
        case .lowPitch:
            playSound(pitch: -933)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(echo: false)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }


}
