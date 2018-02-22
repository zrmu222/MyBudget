//
//  FacebookShareViewController.swift
//  MyBudget
//
//  Created by Zachary Murphy on 2/21/18.
//  Copyright © 2018 Zachary Murphy. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit


class FacebookShareViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    
    @IBOutlet weak var imageTake: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.isEnabled = false
    }
    
    
    @IBAction func selectPhoto(_ sender: UIButton) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func sharePhoto(_ sender: UIButton) {
        let photo:FBSDKSharePhoto = FBSDKSharePhoto()
        photo.image = imageTake.image
        photo.isUserGenerated = true
        let content:FBSDKSharePhotoContent = FBSDKSharePhotoContent()
        content.photos = [photo]
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        shareButton.isEnabled = true
        imagePicker.dismiss(animated: true, completion: nil)
        imageTake.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    
}
