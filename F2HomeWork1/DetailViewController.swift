//
//  DetailViewController.swift
//  F2HomeWork1
//
//  Created by Stephen on 11/9/14.
//  Copyright (c) 2014 Sherwood. All rights reserved.
//

import UIKit
import MobileCoreServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var firstNameTextField : UITextField!
    @IBOutlet weak var lastNameTextField : UITextField!
    @IBOutlet weak var imageView : UIImageView!
    @IBAction func cameraButtonPress(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)
        {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
    }
    
    var selection : Person?
    var imagePickerController = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        self.title = self.selection.returnsName()
        self.firstNameTextField.text = self.selection!.firstName
        self.lastNameTextField.text = self.selection!.lastName
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.selection?.firstName = self.firstNameTextField.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = image
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        self.selection?.image = image
    }
    
}
