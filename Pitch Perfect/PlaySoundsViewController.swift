//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Vighnesh Rege on 1/15/16.
//  Copyright © 2016 Vighnesh Rege. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var player: AVAudioPlayer!
    var engine: AVAudioEngine!
    var audioFile: AVAudioFile!
    var filePath: NSURL!
    var receivedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        player.enableRate = true
        if !player.prepareToPlay() {
            print("Trouble preparing to play")
        }
        engine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slowDown(sender: UIButton) {
        playAtSpeed(0.5)
    }

    @IBAction func speedUp(sender: UIButton) {
        playAtSpeed(1.5)
    }

    @IBAction func chipmunkLike(sender: UIButton) {
        playWithPitch(1000.0)
    }
    
    @IBAction func darthVaderLike(sender: UIButton) {
        playWithPitch(-1000.0)
    }
    

    func playWithPitch(pitch: Float) {
        player.stop()
        engine.stop()
        engine.reset()
        
        let playerNode = AVAudioPlayerNode()
        engine.attachNode(playerNode)
        
        let changePitch = AVAudioUnitTimePitch()
        changePitch.pitch = pitch
        engine.attachNode(changePitch)

        engine.connect(playerNode, to: changePitch, format: nil)
        engine.connect(changePitch, to: engine.outputNode, format: nil)
        playerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! engine.start()
        playerNode.play()
    }
    
    @IBAction func stop(sender: UIButton) {
        player.stop()
        engine.stop()
    }
    
    func playAtSpeed(speed: Float) {
        player.stop()
        engine.stop()
        player.rate = speed
        player.currentTime = 0.0
        player.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
