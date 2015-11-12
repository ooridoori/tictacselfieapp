//
//  Players.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/25/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import Foundation
import UIKit


class Player {
 
  var currentIndex = 0
  var imageArray = [UIImage]()
  
  func addImage(image:UIImage?) {
    imageArray.append(image!)
  }

}

var playerImages = Player()


