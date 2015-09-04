//
//  ViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/24/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var grid1: UIButton!
    @IBOutlet var grid2: UIButton!
    @IBOutlet var grid3: UIButton!
    @IBOutlet var grid4: UIButton!
    @IBOutlet var grid5: UIButton!
    @IBOutlet var grid6: UIButton!
    @IBOutlet var grid7: UIButton!
    @IBOutlet var grid8: UIButton!
    @IBOutlet var grid9: UIButton!
  
  @IBOutlet var playerStatus: UILabel!
  
  var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
    }
  
  var imagePicker: UIImagePickerController!
  var imagesArray = [ [String: UIImage] ]()
  var winnerArray = [UIImage?]()
  
  
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    
    var turnCounter = 0
    var gridStatus = [String: String]()
    var rowCombos = ["","","","","","","","",""]
    var currentPlayerMark = "x"
  
    func isCatsGame(turnCount: Int) -> Bool {
      if turnCount == 9 {
        print("game over!")
        return true
      } else {
        return false
      }
    }
 
  
    func alternatePlayers() {
      if turnCounter % 2 == 0 {
        self.currentPlayerMark = "x"
        self.playerStatus.text = "It is O's turn"
      } else {
        self.currentPlayerMark = "o"
        self.playerStatus.text = "It is X's turn"
      }
      
    }
  
    func whichImage() -> UIImage {
      var image = UIImage()
      if currentPlayerMark == "x" {
        image = UIImage(named: "x-1.png")!
      } else {
        image = UIImage(named: "o-1.png")!
      }
      return image
    }

    func startTurn(button: UIButton){
      
      alternatePlayers()
      //get x or o
            
      button.setImage(whichImage(), forState: UIControlState.Normal)
      button.userInteractionEnabled = false
      
      ++turnCounter
      
      //saving the player's mark in our rowcombos array [x,o,o,x..]
      rowCombos[button.tag] = currentPlayerMark
      
    }
  
  
  func checkWinner() {
    
      println(rowCombos)
      
      var endGame = false
      var winner = ""
      var x = "x"
      var o = "o"
      
      if rowCombos[0] == "x" && rowCombos[1] == "x" && rowCombos[2] == "x" {
        println("x wins!")
        endGame = true
        winner = "x"
      }else if rowCombos[0] == "o" && rowCombos[1] == "o" && rowCombos[2] == "o"{
        println("o wins!")
        endGame = true
        winner = "o"
      }else if rowCombos[3] == "x" && rowCombos[4] == "x" && rowCombos[5] == "x" {
        println("x wins!")
        winner = x
        endGame = true
      }else if rowCombos[3] == "o" && rowCombos[4] == "o" && rowCombos[5] == "o" {
        println("o wins!")
        winner = o
        endGame = true
      } else if rowCombos[6] == "x" && rowCombos[7] == "x" && rowCombos[8] == "x"{
        println("x wins!")
                winner = x
        endGame = true
      } else if rowCombos[6] == "o" && rowCombos[7] == "o" && rowCombos[8] == "o"{
        println("o wins!")
                winner = o
        endGame = true
      } else if rowCombos[0] == "x" && rowCombos[3] == "x" && rowCombos[6] == "x"{
        println("x wins!")
                winner = x
        endGame = true
      } else if rowCombos[0] == "o" && rowCombos[3] == "o" && rowCombos[6] == "o"{
        println("o wins!")
                winner = o
        endGame = true
      } else if rowCombos[1] == "x" && rowCombos[4] == "x"  && rowCombos[7] == "x"{
        println("x wins!")
                winner = x
        endGame = true
      } else if rowCombos[1] == "o" && rowCombos[4] == "o" && rowCombos[7] == "o"{
        println("o wins!")
                winner = o
        endGame = true
      } else if rowCombos[2] == "x" && rowCombos[5] == "x" && rowCombos[8] == "x"{
        println("x wins!")
                winner = x
        endGame = true
      } else if rowCombos[2] == "o" && rowCombos[5] == "o" && rowCombos[8] == "o"{
        println("o wins!")
                winner = o
        endGame = true
      } else if rowCombos[0] == "x" && rowCombos[4] == "x" && rowCombos[8] == "x"{
        println("x wins!")
        winner = x
        endGame = true
      } else if rowCombos[0] == "o"  && rowCombos[4] == "o" && rowCombos[8] == "o"{
        println("o wins!")
                winner = o
        endGame = true
      } else if rowCombos[2] == "x" && rowCombos[4] == "x" && rowCombos[6] == "x"{
        winner = x
        println("x wins!")
        endGame = true
      } else if rowCombos[2] == "o" && rowCombos[4] == "o" && rowCombos[6] == "o"{
        println("o wins!")
        winner = o
        endGame = true
      }
    
      print(isCatsGame(turnCounter), "is all grid filled up???")

      if winner == "x" || winner == "o" {
        self.performSegueWithIdentifier("winnerSegue", sender: nil)
      } else if isCatsGame(turnCounter) {
        self.performSegueWithIdentifier("winnerSegue", sender: nil)
      }

    }
  
    @IBAction func tapButtonAction(sender: UIButton) {
      useImagePicker()
      pressedButton()
      startTurn(sender)
    }
  
  func useImagePicker() {
    imagePicker = UIImagePickerController()
    imagePicker.delegate = self

    var frontCam = UIImagePickerControllerCameraDevice.Front
    if UIImagePickerController.isCameraDeviceAvailable(frontCam) {
      imagePicker.sourceType = .Camera
      imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.Front;
      println("front camera ")
      presentViewController(imagePicker, animated: true, completion: nil)
      
    } else {
      imagePicker.sourceType = .PhotoLibrary
      println("no camera ")
      presentViewController(imagePicker, animated: true, completion: nil)
      
    }    
    
  }

  func imagePickerController(picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [NSObject: AnyObject]){
    
    
    var imageToSave = info[UIImagePickerControllerOriginalImage] as? UIImage
    
    let imageData = UIImagePNGRepresentation(imageToSave)
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
    let imagePath = paths.stringByAppendingPathComponent("PlayerX.png")
    
    if !imageData.writeToFile(imagePath, atomically: false)
    {
      println("not saved")
    } else {
      println("saved")
      NSUserDefaults.standardUserDefaults().setObject(imagePath, forKey: "imagePath")
    }
    
    println(imagePath)
    var playerPhoto = [currentPlayerMark: imageToSave!]
    self.imagesArray.append(playerPhoto)
    println(self.imagesArray)
      
//    UIImageWriteToSavedPhotosAlbum(imageToSave,nil,nil,nil)

      
    self.dismissViewControllerAnimated(true, completion: checkWinner )
      
  }
  
  

  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    var announcement = ""
    var photos = [UIImage?]()
//    println("prepareForSegue got this sender:", sender)
  
    if isCatsGame(turnCounter) {
    
      photos.append(UIImage(named:"cat1.jpg") )
      photos.append(UIImage(named:"cat2.jpg") )
      photos.append(UIImage(named:"cat3.jpeg") )
      
      announcement = "Cat's game!!!"
      
    } else {
      
      
      // for every element gives you back a new array of values for the winner
      photos = self.imagesArray.map{ $0[self.currentPlayerMark] }
                               .filter({ $0 != nil })
      // filter out all the nil elements out of the array

      announcement = "The winner is \(currentPlayerMark)!"
      
      
      
    }


    let winnersPage = segue.destinationViewController as! WinnersPageViewController
    
    winnersPage.winnerLabel = announcement
    
    println("printing the photos: \(photos)")

    winnersPage.winnerImages = photos
    
    if isCatsGame(turnCounter){
      winnersPage.gameResult = "cat wins"
    } else {
      winnersPage.gameResult = "player wins"
    }
    
  }
    
}







