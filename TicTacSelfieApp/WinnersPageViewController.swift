//
//  WinnersPageViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/25/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit

class WinnersPageViewController: UIViewController {
  
  @IBOutlet var label: UILabel!
  
  @IBOutlet var mainImageView: UIImageView!
  var winnerLabel: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.label.text = self.winnerLabel
      
      // Sets a timer for every second and calls method changeImage
      NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "changeImage", userInfo: nil, repeats: true)
      
      // Do any additional setup after loading the view.
  }
  
  func changeImage () {
    player1.currentIndex++
    var index = player1.currentIndex % 3
    mainImageView.image = player1.imageArray[index]
  
      
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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