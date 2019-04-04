//
//  ViewController.swift
//  HairTrimer
//
//  Created by Duale on 4/4/19.
//  Copyright © 2019 Duale. All rights reserved.
//

import UIKit
import AVFoundation 

class ViewController: UIViewController {
    @IBOutlet weak var ButtonOnes: UIButton!
    
    @IBOutlet weak var SoundBtn: UIButton!
    //    @IBOutlet weak var ButtonOne: UIButton!
    @IBOutlet weak var ButtonTwo: UIButton!
    @IBOutlet weak var ButtonThree: UIButton!
    @IBOutlet weak var ButtonFour: UIButton!
    @IBOutlet weak var ButtonFive: UIButton!
    var soundFile : AVAudioPlayer?
    var trimSound : String = " "
    let sounds = ["trimss"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
          makeCircular(ButtonOnes)
         makeCircular(ButtonTwo)
         makeCircular(ButtonThree)
         makeCircular(ButtonFour)
         makeCircular(ButtonFive)
        SoundBtn.setTitle("OFF", for: .normal)
        
    }
    
    let trimsound = Bundle.main.url(forResource: "trims  ", withExtension: "mp3")
    var audioPlayer = AVAudioPlayer()
//    @IBAction func onPressButton(_ sender: UIButton) {
//        SoundBtn.setTitle("ONN", for: .normal)
//        trimSound = sounds[sender.tag - 1]
//        soundPlayed()
//
//    }
    
    @IBAction func onPressButtonn(_ sender: UIButton) {
        soundFile?.currentTime = 0
        SoundBtn.setTitle("ONN", for: .normal)
        trimSound = sounds[sender.tag - 1]
        soundPlayed()
    }
    func soundPlayed () {
        let soundURL = Bundle.main.url(forResource: trimSound , withExtension: "mp3")
        do {
            //set up the contents of the audio player that we created
            // this is the equivalent of opening up a cd player and putting in your music
            soundFile = try AVAudioPlayer(contentsOf: soundURL!)
            //
            
        } catch{
            print(error)
        }
        soundFile?.play()
        
    }
    
//    @IBAction func onBackroundPress(_ sender: UIButton) {
//
//        if (sender.tag == 2 ) {
//            view.backgroundColor = .red
//        } else if (sender.tag == 3 ) {
//            self.view.backgroundColor = .blue
//        }
//        else if (sender.tag == 4 ) {
//             view.backgroundColor = .white
//        }
//        else if (sender.tag == 5 ) {
//            view.backgroundColor = .darkGray
//        }
//        else if (sender.tag == 6 ) {
//            view.backgroundColor = .yellow
//        }
//    }
    
    @IBOutlet weak var backGround: UIImageView!
    
    @IBAction func changeBackGround(_ sender: AnyObject) {
        if (sender.tag == 2 ) {
            backGround.backgroundColor = .red
        } else if (sender.tag == 3 ) {
            backGround.backgroundColor = .blue
        }
        else if (sender.tag == 4 ) {
           backGround.backgroundColor = .white
        }
        else if (sender.tag == 5 ) {
            backGround.backgroundColor = .darkGray
        }
        else if (sender.tag == 6 ) {
           backGround.backgroundColor = .yellow
        }
    }
    
    
    func makeCircular (_ object: AnyObject) {
        if #available(iOS 12.0, *) {
            object.layer.cornerRadius = object.frame.size.width / 2
        } else {
            // Fallback on earlier versions
        }
        object.layer?.masksToBounds = true
        
    }
}


