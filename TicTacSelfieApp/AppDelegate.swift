//
//  AppDelegate.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/24/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit
import Firebase

let FirebaseUrl = "https://tictacselfie.firebaseio.com"
let TappableRed = UIColor(red: 255.0/255.0, green: 167.0/255.0, blue: 127.0/255.0, alpha: 1.0)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  override init() {
    super.init()
    Firebase.defaultConfig().persistenceEnabled = true
    
  }

}

