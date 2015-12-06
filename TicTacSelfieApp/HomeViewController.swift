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
import Firebase
import QuartzCore

class CameraViewController: UIViewController {
  
  var audioPlayer = AVAudioPlayer()
  var gcEnabled = Bool()
  
  let loginToList = "loginToList"
  let ref = Firebase(url:"https://tictacselfie.firebaseio.com")
  
  @IBOutlet var emailTF: UITextField!
  @IBOutlet var passwordTF: UITextField!
  
//  var localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
//  
//  func authenticateLocalPlayer(){
//       localPlayer.authenticateHandler = {(ViewController,error) -> Void in
//      if ((ViewController) != nil) {
//        self.presentViewController(ViewController!, animated: true, completion: nil)
//      } else if (self.localPlayer.authenticated) {
//        print("local player authenticated")
//        self.gcEnabled = true
//        
//        print("am i authenticated?????", self.localPlayer)
//        
//        let matchRequest = GKMatchRequest.init()
//        matchRequest.defaultNumberOfPlayers = 2
//        matchRequest.minPlayers = 2
//        matchRequest.maxPlayers = 2
//        
//        let vc = GKTurnBasedMatchmakerViewController.init(matchRequest: matchRequest)
//        vc.turnBasedMatchmakerDelegate = self
//        self.presentViewController(vc, animated: true, completion: nil)
//        
//        }
//    }
//  }
//  
//  func turnBasedMatchmakerViewControllerWasCancelled(viewController: GKTurnBasedMatchmakerViewController) {
//    print("### MM cancelled!")
//    self.dismissViewControllerAnimated(true, completion: nil)
//  }
//  
//  // Matchmaking has failed with an error
//  func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController, didFailWithError error: NSError) {
//    print("### MM failed: \(error)")
//    self.dismissViewControllerAnimated(true, completion: nil)
//  }
//  
//  // A turned-based match has been found, the game should start
//  func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController, didFindMatch match: GKTurnBasedMatch) {
//    print("### Yeah......Game starting......")
//    self.dismissViewControllerAnimated(true, completion: nil)
////    self.performSegueWithIdentifier("MyGameScene", sender: match)
//  }
//  
//  // Called when a users chooses to quit a match and that player has the current turn.  The developer should call playerQuitInTurnWithOutcome:nextPlayer:matchData:completionHandler: on the match passing in appropriate values.  They can also update matchOutcome for other players as appropriate.
//  func turnBasedMatchmakerViewController(viewController: GKTurnBasedMatchmakerViewController, playerQuitForMatch match: GKTurnBasedMatch) {
//    //    println("### Quit.....match")
//    // TODO
//  }
//  
//  override func didReceiveMemoryWarning() {
//    super.didReceiveMemoryWarning()
//    // Dispose of any resources that can be recreated.
//  }
//  
//  @IBAction func testServer(sender: AnyObject) {
//    // Create a reference to a Firebase location
//    // Write data to Firebase
//    myRootRef.setValue("hello jonny")
//    print(myRootRef)
//  }
//  
//  @IBAction func writeToServer(sender: AnyObject) {
//    // Read data and react to changes
//    myRootRef.observeEventType(.Value, withBlock: {
//      snapshot in
//      print("\(snapshot.key) -> \(snapshot.value)")
//    })
//  }
  
  @IBAction func playGameSound(sender: AnyObject) {
   startNewGame()
  }
  
  @IBAction func signUp(sender: AnyObject) {
    let alert = UIAlertController(title: "Register",
      message: "Register",
      preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .Default) {
      (action: UIAlertAction) -> Void in
      
    let emailField = alert.textFields![0]
    let passwordField = alert.textFields![1]
    
    self.ref.createUser(emailField.text, password: passwordField.text) { (error:NSError!) in
      
      if error == nil {
        
        self.ref.authUser(emailField.text, password: passwordField.text,
          withCompletionBlock: { (error,auth) -> Void in
            
        })
      }
    }
    }
    let cancelAction = UIAlertAction(title: "Cancel",
      style: .Default) { (action: UIAlertAction) -> Void in
    }
    
    alert.addTextFieldWithConfigurationHandler {
      (textEmail) -> Void in
      textEmail.placeholder = "Enter your email"
    }
    
    alert.addTextFieldWithConfigurationHandler {
      (textPassword) -> Void in
      textPassword.secureTextEntry = true
      textPassword.placeholder = "Enter your password"
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    presentViewController(alert,
      animated: true,
      completion: nil)
  }

  
  }
  
  
  
//  @IBAction func login(sender: AnyObject) {
//    ref.authUser(emailTF.text, password: passwordTF.text, withCompletionBlock: { (error, auth) in
//    })
//  }
//  
//    override func viewDidLoad() {
//      super.viewDidLoad()
//    }
//  //MARK: LOGIN SEGUE
//  override func viewDidAppear(animated: Bool) {
//    super.viewDidAppear(animated)
//    
//    ref.observeAuthEventWithBlock { (authData) -> Void in
//      if authData != nil {
//        self.performSegueWithIdentifier(self.loginToList, sender: nil)
//      }
//    }
//  }
    
  

