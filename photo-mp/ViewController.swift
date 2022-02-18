//
//  ViewController.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 07.02.2022.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let idCell = "fileCeil"
    
    var files: [String] = ["Tom", "Alice", "Kate"]
    
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
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
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
        
        cell!.textLabel?.text = files[indexPath.row]
        cell!.imageView?.image = UIImage(named: "default.png")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Файлы"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("\(indexPath.row)")
    }
}
