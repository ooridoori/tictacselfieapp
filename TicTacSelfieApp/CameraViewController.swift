//
//  CameraViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/25/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit


class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    
  
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    
    @IBOutlet var imageView4: UIImageView!
    @IBOutlet var imageView5: UIImageView!
    @IBOutlet var imageView6: UIImageView!
   
   
    
    var imagePicker: UIImagePickerController!
    
    
    @IBAction func takePhoto(sender: AnyObject) {
      imagePicker = UIImagePickerController()
      imagePicker.delegate = self
//      imagePicker.sourceType = .Camera
      imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//      imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.Front;
      
      presentViewController(imagePicker, animated: true, completion: nil)
    }
   
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
      
          if imageView.image == nil {
            imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
          } else if imageView2.image == nil {
            imageView2.image = info[UIImagePickerControllerOriginalImage] as? UIImage
          } else if imageView3.image == nil {
            imageView3.image = info[UIImagePickerControllerOriginalImage] as? UIImage
          }
      
      if player1.imageArray.count < 4{
        player1.addImage(info[UIImagePickerControllerOriginalImage] as! UIImage)
        
      } else{
        player2.addImage(info[UIImagePickerControllerOriginalImage] as! UIImage)
        
      }
      
      imagePicker.dismissViewControllerAnimated(true, completion: nil)
      
    }
    
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
    }
    
  }


   