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

  func startNewGame(){
    var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("chime_short_chord_up", ofType: "wav")!)
    println(alertSound)
    var error:NSError?
    audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
    audioPlayer.prepareToPlay()
    audioPlayer.play()
    
  }
  
  func pressedButton(){
    var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("pop_drip", ofType: "wav")!)
    println(alertSound)
    var error:NSError?
    audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
    audioPlayer.prepareToPlay()
    audioPlayer.play()
    
  }
  
  func winnerWinner(){
    var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("dougie", ofType: "mp3")!)
    println(alertSound)
    var error:NSError?
    audioPlayer = AVAudioPlayer(contentsOfURL:alertSound, error: &error)
    audioPlayer.prepareToPlay()
    audioPlayer.play()
    
  }
  
  func catsGame(){
    var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("meow", ofType: "wav")!)
    println(alertSound)
    var error:NSError?
    audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
    audioPlayer.prepareToPlay()
    audioPlayer.play()
    
  }

func blop(){
  var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("blop", ofType: "wav")!)
  println(alertSound)
  var error:NSError?
  audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
  audioPlayer.prepareToPlay()
  audioPlayer.play()
}



