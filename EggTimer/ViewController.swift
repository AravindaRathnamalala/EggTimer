//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var headingText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft" : 30, "Medium" : 45, "Hard" : 100 ]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player =  AVAudioPlayer()

    @IBAction func selectHardness(_ sender: UIButton) {
        timer.invalidate()
        totalTime = eggTimes[sender.currentTitle!]!
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(countDownUpdate), userInfo: nil, repeats: true)
        progressBar.progress = 0.0
        secondsPassed = 0
        headingText.text = sender.currentTitle!
    }
    
    @objc func countDownUpdate() {
        if totalTime > secondsPassed {
            secondsPassed += 1
            print(totalTime)
            print(secondsPassed)
            progressBar.progress = Float(secondsPassed ) / Float(totalTime)
        } else {
            timer.invalidate()
            headingText.text = "Done..!!!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
