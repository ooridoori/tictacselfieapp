//
//  ViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/24/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var grid1: UIButton!
    @IBOutlet var grid2: UIButton!
    @IBOutlet var grid3: UIButton!
    @IBOutlet var grid4: UIButton!
    @IBOutlet var grid5: UIButton!
    @IBOutlet var grid6: UIButton!
    @IBOutlet var grid7: UIButton!
    @IBOutlet var grid8: UIButton!
    @IBOutlet var grid9: UIButton!
    
   
    
    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    
    var turnCounter = 0
    var gridStatus = [String: String]()
    var rowCombos = ["","","","","","","","",""]
    var currentPlayerMark = "x"
//    var image = UIImage()
  
    func checkGameOver(turnCount: Int) -> Bool {
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
      } else {
        self.currentPlayerMark = "o"
      }
      
    }
  
    func whichImage() -> UIImage {
      var image = UIImage()
      if currentPlayerMark == "x" {
        image = UIImage(named: "x.png")!
      } else {
        image = UIImage(named: "o.png")!
      }
      return image
    }

    func startTurn(button: UIButton){
      alternatePlayers()
      
      button.setImage(whichImage(), forState: UIControlState.Normal)
      
      ++turnCounter
      
      //        saving the player's mark in our rowcombos array
      rowCombos[button.tag] = currentPlayerMark
      
      //        check winner
      checkGrid(currentPlayerMark)
      
      if checkGameOver(turnCounter) {
        print("restarting")
        
        turnCounter = 0
      }
    }
    
    func checkGrid(mark: String){
      println(rowCombos)
      
      var endGame = false
      
      if rowCombos[0] == mark && rowCombos[1] == mark && rowCombos[2] == mark {
        println("you win!")
        endGame = true
      } else if rowCombos[3] == mark && rowCombos[4] == mark && rowCombos[5] == mark {
        println("you win!")
        endGame = true
      } else if rowCombos[6] == mark && rowCombos[7] == mark && rowCombos[8] == mark {
        println("you win!")
        endGame = true
      } else if rowCombos[0] == mark && rowCombos[3] == mark && rowCombos[6] == mark {
        println("you win!")
        endGame = true
      } else if rowCombos[1] == mark && rowCombos[4] == mark && rowCombos[7] == mark {
        println("you win!")
        endGame = true
      } else if rowCombos[2] == mark && rowCombos[5] == mark && rowCombos[8] == mark {
        println("you win!")
        endGame = true
      } else if rowCombos[0] == mark && rowCombos[4] == mark && rowCombos[8] == mark {
        println("you win!")
        endGame = true
      } else if rowCombos[2] == mark && rowCombos[4] == mark && rowCombos[6] == mark {
        println("you win!")
        endGame = true
      } else {
        if checkGameOver(turnCounter){
          performSegueWithIdentifier("winnerSegue", sender: "Cat's game")
        }
      }
      
      if endGame {
        performSegueWithIdentifier("winnerSegue", sender: nil)
      }
      
    }
    
    
    @IBAction func tapButtonAction(sender: UIButton) {
      startTurn(sender)
     
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      var announcement = ""
      if sender != nil {
        announcement = "Cat's game!!!!"
      } else {
        announcement = "the winner is \(currentPlayerMark)"
      }
      
      let winnersPage = segue.destinationViewController as! WinnersPageViewController
      
      winnersPage.winnerLabel = announcement
    }
    
  }







