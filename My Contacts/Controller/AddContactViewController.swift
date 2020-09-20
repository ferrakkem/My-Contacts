//
//  AddContactViewController.swift
//  My Contacts
//
//  Created by Ferrakkem Bhuiyan on 2020-09-14.
//  Copyright © 2020 Ferrakkem Bhuiyan. All rights reserved.
//

import UIKit
import RealmSwift

class AddContactViewController: UIViewController{
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var number: UITextField!
    
    var imageUrlString: String?
    
    var imageData: Data?  =  nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.setRounded()
    }
    //MARK: - Add User Picture
    
    @IBAction func addPicture(_ sender: UIButton) {
        showImagePickerControllerActionSheet()
    }
    
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        print("doneAction")
        saveContact()
        dismiss(animated: true, completion: nil)
    }
        
    func saveContact() {
                
        let realm = try! Realm()
        do{
            try realm.write{
                let object = ContactModel()
                object.name = self.firstName.text
                object.number = self.number.text
                //object.imageData = self.imageUrlString
                realm.add(object)
            }
        }catch{
            print("Error during contact saving: \(error)")
        }
        
    }
}

//MARK: - UIImageView for Make rounded
extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.height / 2)
        self.layer.masksToBounds = true
    }
    
}

//MARK: - UIImagePickerControllerDelegate and UINavigationControllerDelegate
extension AddContactViewController:  UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func showImagePickerControllerActionSheet() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        let photoLibrary = UIAlertAction(title: "Choose form library", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        
        let cameraAction = UIAlertAction(title: "Tale form Camera", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(photoLibrary)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        //imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        /*
        let documentsPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsPath = documentsPaths.first
        print(documentsPath!)
        
        imageUrlString = documentsPath!
        */
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            userImage.image = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            userImage.image = originalImage
        }
        


        dismiss(animated: true, completion: nil)
    }
    
    func getImageData(info:[String : Any]) -> Data {
        let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
        let data = image.jpegData(compressionQuality: 0.7)
        return data!
    }
    
}
