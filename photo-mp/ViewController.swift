//
//  ViewController.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 07.02.2022.
//

import UIKit
import Photos

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let idCell = "fileCeil"

    var files: [File] = []
    
    @IBOutlet weak var button: UIButton!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var PhotoPicker: UIImagePickerController!
    
    
    @IBAction func takeFromGallery(_ sender: Any) {
        PhotoPicker = UIImagePickerController()
        PhotoPicker.delegate = self
        PhotoPicker.sourceType = .savedPhotosAlbum
        PhotoPicker.allowsEditing = true
                
        present(PhotoPicker, animated: true, completion: nil)
    }
    
    
    @IBAction func takePhoto(_ sender: Any) {
        
        PhotoPicker = UIImagePickerController()
        PhotoPicker.delegate = self
        PhotoPicker.sourceType = .camera
        PhotoPicker.allowsEditing = true
                
        present(PhotoPicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            var name = "Изображение"
            if let asset = info[UIImagePickerController.InfoKey.phAsset] as? PHAsset, let fileName = asset.value(forKey: "filename") as? String {
                name = fileName
            }
            
            let file = File(
                title: name,
                imageFile: pickedImage
            )

            files.insert(file, at: files.count)
            tableView.reloadData()
        }

        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    
        
        let cellTypeNib = UINib(nibName: "FileViewCell", bundle: nil)
        tableView.register(cellTypeNib, forCellReuseIdentifier: "FileViewCell")
        
        
        let colors = [
            UIColor(red: 1/255, green: 109/255, blue: 255/255, alpha: 1.0).cgColor,
            UIColor(red: 0, green: 82/255, blue: 255/255, alpha: 1.0).cgColor
        ]
        

        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 12
        gradientLayer.colors = colors
        gradientLayer.transform = CATransform3DMakeRotation(270 / 180 * CGFloat.pi, 0, 0, 1)
        gradientLayer.frame = button.bounds

        button.layer.insertSublayer(gradientLayer, at: 0)
        button.layer.cornerRadius = 12
    }


}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: idCell)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        }
        
        cell!.textLabel?.text = files[indexPath.row].title
        cell!.imageView?.image = files[indexPath.row].imageFile != nil ? files[indexPath.row].imageFile : UIImage(named: "default.png")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Файлы"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    

}

