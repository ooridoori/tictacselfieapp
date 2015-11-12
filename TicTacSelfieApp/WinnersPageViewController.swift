//
//  WinnersPageViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/25/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit
import AVFoundation
import Social
import SwiftGIF

class WinnersPageViewController: UIViewController {
  
  @IBOutlet var label: UILabel!
  @IBOutlet var mainImageView: UIImageView!
  
  var winnerLabel: String?
  var winnerImages = [UIImage?]()
  var timer =  NSTimer()
  var audioPlayer = AVAudioPlayer()
  
  var gameResult = String()
  var imageData = NSData()
  
  
  
  
  @IBAction func shareOnTwitter(sender: AnyObject) {
  
    var textToShare = "I just won TicTacSelfie! 😜"
    
    var objectsToShare = [textToShare,self.imageData]
    
    let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
    
    self.presentViewController(activityVC, animated: true, completion: nil)

    
  }
  
  
  

    override func viewDidLoad() {
        super.viewDidLoad()

      if self.gameResult == "cat wins"{
        catsGame()
      } else {
        winnerWinner()
      }

      
      self.label.text = self.winnerLabel
      self.mainImageView.contentMode = .ScaleAspectFit
      self.mainImageView.image = self.winnerImages[0]
      println(self.winnerLabel)
      
      let justImages:[UIImage] = self.winnerImages.map{ $0! }
      
//------* SWIFTGIF: makes and stores gif into temp file *-------
    
      createGIF(with: justImages, repeatCount: 0, 0.3 ) { (gifData, err, url) -> () in
        if err == nil {
          println("createGIF callback, url")
          println(url)
          
            self.imageData = NSData(contentsOfURL: url!)!
          

        }
        
         
      }

      
      
      // Sets a timer for every second and calls method changeImage
      self.timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self,
        selector: "animateImage", userInfo: nil, repeats: true)
      
      // Do any additional setup after loading the view.
  }
  @IBAction func playAgain(sender: AnyObject) {
    blop()
    self.timer.invalidate()

  }
  
  func animateImage () {
    playerImages.currentIndex++
    let imageCount:Int = winnerImages.count
    var index = playerImages.currentIndex % imageCount
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