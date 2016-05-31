//
//  AddPostVC.swift
//  MyHood
//
//  Created by Ellen Shin on 5/25/16.
//  Copyright © 2016 Ellen Shin. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDesc: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    var imgPicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }
    
    @IBAction func makePostBtnPressed(sender: AnyObject) {
        
        if let title = postTitle.text, let desc = postDesc.text, let img = postImg.image {
            
            let imgPath = DataService.instance.saveImgAndCreatePath(img)
            
            let post = Post(title: title, imagePath: imgPath, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addImgBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
}
