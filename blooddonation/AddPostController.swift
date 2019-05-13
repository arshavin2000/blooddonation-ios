//
//  AddPostController.swift
//  blooddonation
//
//  Created by user on 4/26/19.
//  Copyright © 2019 Esprit. All rights reserved.
//

import UIKit
import Alamofire

class AddPostController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    var username:String = "";
    var imageProfile:String = "";
    @IBOutlet weak var laImgProfile: UIImageView!
    @IBOutlet weak var laUsername: UILabel!
    @IBOutlet weak var laContent: UITextView!
    @IBOutlet weak var laImagePicked: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        laUsername.text = username

        let url = URL(string: imageProfile)
        let dataImgProfile = try? Data(contentsOf: url!)
        laImgProfile.image = UIImage(data: dataImgProfile!)

        // Do any additional setup after loading the view.

        laContent!.layer.borderWidth = 1
       self.laContent.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        self.laContent.layer.cornerRadius = 13
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    @IBAction func pickerImage(_ sender: Any) {


    }


    @IBAction func AddFromCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }

    }
    @IBAction func AddFromLibrary(_ sender: Any) {

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)

        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            laImagePicked.image = image
            dismiss(animated:true, completion: nil)
    }


    @IBAction func AddPost(_ sender: Any) {
        uploadImage();
    }


    func uploadImage(){
        let parameters = [
            "titre" :        "titre",
            "description":      "Murat Akdeniz"]

        guard let imageData = laImagePicked.image!.jpegData(compressionQuality: 0.5) else {
            //self.addservice()
            print("Could not get JPEG representation of UIImage")
            return
        }

        let headers: HTTPHeaders = [:]




        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image",fileName: "image", mimeType: "image/jpg")
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            } //Optional for extra parameters
        },
            to:  "http://192.168.1.14:11808/api/uploadfile/",
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    print("Success ###")

                case .failure(let encodingError):
                    print("ERROR $$$")
                }

        })



    }
}
