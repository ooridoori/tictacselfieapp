//
//  Person.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/29/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit
import AVFoundation

 
  var audioPlayer = AVAudioPlayer()

  func playSound(clip_name: String, clip_type: String) {
      let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(clip_name, ofType: clip_type)!)
//      print(alertSound)
      try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, withOptions: [])
      try! AVAudioSession.sharedInstance().setActive(true)

      do {
        try audioPlayer = AVAudioPlayer(contentsOfURL: alertSound)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
      } catch {
        print("there is \(error)")
      }
  }


  func startNewGame(){
//    let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("chime_short_chord_up", ofType: "wav")!)

    playSound("chime_short_chord_up", clip_type: "wav")
    
  }
  
  func pressedButton(){
//    let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("pop_drip", ofType: "wav")!)

    playSound("pop_drip", clip_type: "wav")
    
  }
  
  func winnerWinner(){
//    let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("dougie", ofType: "mp3")!)
    
    playSound("dougie", clip_type: "mp3")
    
  }
  
  func catsGame(){
//    let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("meow", ofType: "wav")!)
    
    playSound("meow", clip_type: "wav")
    
  }

func blop(){
//  let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("blop", ofType: "wav")!)
  
    playSound("blop", clip_type: "wav")
  }


