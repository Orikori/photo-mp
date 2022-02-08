//
//  ViewController.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 07.02.2022.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    var PhotoPicker: UIImagePickerController!
    
    @IBAction func takePhoto(_ sender: Any) {
        
        PhotoPicker = UIImagePickerController()
        PhotoPicker.delegate = self
        PhotoPicker.sourceType = .camera
        PhotoPicker.allowsEditing = true
        
        present(PhotoPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        PhotoPicker.dismiss(animated: true, completion: nil)
        
      
        //imageView.image = editingInfo![UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

