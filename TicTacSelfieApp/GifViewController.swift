//
//  GifViewController.swift
//  TicTacSelfieApp
//
//  Created by Nancy Kim on 8/27/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit

class GifViewController: UIViewController {

  @IBOutlet var movingPic: UIImageView!
  
  var imageArray = [UIImage]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      print(self.imageArray)
      if self.imageArray.count > 0 {
        testImage.image = self.imageArray.first
      }

    }
  
//    var picBox = movingPic.image

  @IBOutlet var testImage: UIImageView!
  
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
