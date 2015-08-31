//
//  CameraViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/25/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit
import AVFoundation


class CameraViewController: UIViewController{
  
  var audioPlayer = AVAudioPlayer()
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    
  @IBAction func playGameSound(sender: AnyObject) {
   startNewGame()
    
  }
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
  }


   