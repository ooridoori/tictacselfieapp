//
//  IMGPICKERViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/26/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit

class IMGPICKERViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
    }
  
  var imagePicker: UIImagePickerController!
  var imagesArray = [UIImage]()

  @IBAction func takePhoto(sender: AnyObject) {
    imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    
    presentViewController(imagePicker, animated: true, completion: nil)
    
  }
  
  func imagePickerController(picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
      var pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
      
      self.imagesArray.append(pickedImage!)
      
      print(imagesArray.count)
      
      self.dismissViewControllerAnimated(true, completion: nil)
  }
  

  @IBAction func goAction(sender: AnyObject) {
    performSegueWithIdentifier("gifPage", sender: nil)

  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

         let lastPage = segue.destinationViewController as! GifViewController
         lastPage.imageArray = self.imagesArray
      
    }
  

}
