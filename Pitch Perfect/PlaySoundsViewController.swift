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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3") {
            player = try! AVAudioPlayer(contentsOfURL: url)
            player.enableRate = true
            if !player.prepareToPlay() {
                print("Trouble preparing to play")
            }
        } else {
            print("File not found")
        }
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

    @IBAction func stop(sender: UIButton) {
        player.stop()
    }
    
    func playAtSpeed(speed: Float) {
        player.stop()
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
