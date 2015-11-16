//
//  CameraViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/25/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit
import AVFoundation
import GameKit


class CameraViewController: UIViewController, GKTurnBasedMatchmakerViewControllerDelegate {
  
  var audioPlayer = AVAudioPlayer()
  var gcEnabled = Bool()
  
  var localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
  
  func authenticateLocalPlayer(){
       localPlayer.authenticateHandler = {(ViewController,error) -> Void in
      if ((ViewController) != nil) {
        self.presentViewController(ViewController!, animated: true, completion: nil)
      } else if (self.localPlayer.authenticated) {
        print("local player authenticated")
        self.gcEnabled = true
        
        print("am i authenticated?????", self.localPlayer)
        
        let matchRequest = GKMatchRequest.init()
        matchRequest.defaultNumberOfPlayers = 2
        matchRequest.minPlayers = 2
        matchRequest.maxPlayers = 2
        
        let vc = GKTurnBasedMatchmakerViewController.init(matchRequest: matchRequest)
        vc.turnBasedMatchmakerDelegate = self
        self.presentViewController(vc, animated: true, completion: nil)
        
        }
    }
  }
  
  func turnBasedMatchmakerViewControllerWasCancelled(viewController: GKTurnBasedMatchmakerViewController) {
    print("### MM cancelled!")
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  // Matchmaking has failed with an error
  func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController, didFailWithError error: NSError) {
    print("### MM failed: \(error)")
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  // A turned-based match has been found, the game should start
  func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController, didFindMatch match: GKTurnBasedMatch) {
    print("### Yeah......Game starting......")
    self.dismissViewControllerAnimated(true, completion: nil)
//    self.performSegueWithIdentifier("MyGameScene", sender: match)
  }
  
  // Called when a users chooses to quit a match and that player has the current turn.  The developer should call playerQuitInTurnWithOutcome:nextPlayer:matchData:completionHandler: on the match passing in appropriate values.  They can also update matchOutcome for other players as appropriate.
  func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController, playerQuitForMatch match: GKTurnBasedMatch) {
    //    println("### Quit.....match")
    // TODO
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
  @IBAction func startMultiplayer(sender: AnyObject) {
    
    authenticateLocalPlayer()
  }
  
  @IBAction func playGameSound(sender: AnyObject) {
   startNewGame()
  }
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
  }

