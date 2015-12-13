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

class HomeViewController: UIViewController {
  
  var audioPlayer = AVAudioPlayer()
  var gcEnabled = Bool()
  
  let loginToList = "loginToList"
  let ref = Firebase(url:"https://tictacselfie.firebaseio.com")
  
 
  @IBOutlet var email: UITextField!
  
  @IBOutlet var password: UITextField!
  
  
  
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

  @IBAction func loginAction(sender: AnyObject) {
    ref.authUser(email.text, password: password.text, withCompletionBlock: { (error,auth) in
      if (error != nil) {
        print(error)
      }
      if (auth != nil) {
      self.performSegueWithIdentifier(self.loginToList, sender: nil)
        print(auth)
      }
    })
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    ref.observeAuthEventWithBlock { (authData) -> Void in
            if authData != nil {
              self.performSegueWithIdentifier(self.loginToList, sender: nil)
               print(authData)

      }
    }
  }
  
}
