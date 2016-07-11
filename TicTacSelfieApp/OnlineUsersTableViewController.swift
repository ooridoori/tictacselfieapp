//
//  MatchTableViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 12/11/15.
//  Copyright © 2015 Nancy Kim. All rights reserved.
//

import UIKit
import Firebase

class OnlineUsersTableViewController: UITableViewController {
  let UserCell = "UserCell"
  let rootRef = Firebase(url: "https://tictacselfie.firebaseio.com/")
  let usersRef = Firebase(url: "https://tictacselfie.firebaseio.com/users")
  let matchesRef = Firebase(url: "https://tictacselfie.firebaseio.com/matches")
  
  var matchItems = [AnyObject]()
  
  var currentUsers: [String] = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
//    print("usersRef", usersRef)
//  
//    usersRef.observeEventType(.ChildAdded, withBlock: {(snap: FDataSnapshot!) in
//      print(snap,"snap")
//    self.currentUsers.append(snap.value as! String)
//    let row = self.currentUsers.count - 1
//    let indexPath = NSIndexPath(forRow: row, inSection:0)
//      self.tableView.insertRowsAtIndexPaths ([indexPath],withRowAnimation : .Top)
//    })
//    
//    usersRef.observeEventType(.ChildRemoved, withBlock: {(snap:FDataSnapshot!) -> Void
//      in
//      let emailToFind: String! = snap.value as! String
//      for (index, email) in self.currentUsers.enumerate() {
//        if email == emailToFind {
//          let indexPath = NSIndexPath(forRow:index, inSection: 0)
//          self.currentUsers.removeAtIndex(index)
//          self.tableView.deleteRowsAtIndexPaths ([indexPath], withRowAnimation: .Fade)
//          }
//        
//        }
//      })
    
    // Attach a closure to read the data at our posts reference
    matchesRef.observeEventType(.Value, withBlock: { snapshot in
      self.matchItems = [] // reset it everytime a new data gets added
      
      for item in snapshot.children {
        self.matchItems.append(item)
      }
      
      self.tableView.reloadData()
//      print("matchitems", self.matchItems)
      
      }, withCancelBlock: { error in
        print(error.description)

    })
    
  }
  
  override func tableView(tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
//      print("# of rows----", self.matchItems.count)
      return self.matchItems.count
  }
  
  override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier(UserCell) as UITableViewCell!
      let match = matchItems[indexPath.row] as! FDataSnapshot
      
      let gameRoom = match.value.objectForKey("gameRoom") as? String
      let email = match.value.objectForKey("username") as? String
      cell.textLabel?.text = gameRoom
      cell.detailTextLabel?.text = email
      
//      print("what is match=------", match.value.objectForKey("gameRoom") )
//      cell.textLabel?.text = match as! String
      return cell
  }
  
  @IBAction func createMatch(sender: AnyObject) {
    print("creating match")
  
    print(self.rootRef)
    let authUser = self.rootRef.authData.providerData
    
//    print("authUser", authUser)
    
    print("this is self.rootRef", self.rootRef)
    
    
    let alert = UIAlertController(title: "New Match",
      message: "Add a Match",
      preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Save",
      style: .Default) { (action: UIAlertAction) -> Void in
        
        let textField = alert.textFields![0]
        print("match name", textField.text!)
        
//        TODO: Make struct model
        let matchItem = [
          "gameRoom": textField.text!,
          "username": authUser["email"] as! String] as AnyObject
        
        let ref = self.matchesRef.childByAppendingPath(textField.text?.lowercaseString)
        ref.setValue(matchItem)
        
    }
    
    let cancelAction = UIAlertAction(title: "Cancel",
      style: .Default) { (action: UIAlertAction) -> Void in
    }

    
    alert.addTextFieldWithConfigurationHandler {
      (textField: UITextField!) -> Void in
    }
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    presentViewController(
      alert,
      animated: true,
      completion: nil
    )
    
  }
  
  
  @IBAction func backLogOut(sender: UIBarButtonItem) {
    rootRef.unauth();
  }
  
  
  
}





