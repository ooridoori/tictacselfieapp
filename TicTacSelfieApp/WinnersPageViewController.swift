//
//  WinnersPageViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/25/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit
import AssetsLibrary

class WinnersPageViewController: UIViewController {
  
  @IBOutlet var label: UILabel!
  @IBOutlet var mainImageView: UIImageView!
  
  var winnerLabel: String?
  var winnerImages = [UIImage?]()
  var timer =  NSTimer()
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.label.text = self.winnerLabel
      self.mainImageView.contentMode = .ScaleAspectFit
      self.mainImageView.image = self.winnerImages[0]
      println(self.winnerLabel)
      
      
      // Sets a timer for every second and calls method changeImage
      self.timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self,
        selector: "animateImage", userInfo: nil, repeats: true)
      
      // Do any additional setup after loading the view.
  }
  @IBAction func playAgain(sender: AnyObject) {
    self.timer.invalidate()
  }
  
  func animateImage () {
    player1.currentIndex++
    var index = player1.currentIndex % 3
    println(index)
    mainImageView.image = self.winnerImages[index]

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