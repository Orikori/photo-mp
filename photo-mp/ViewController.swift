//
//  ViewController.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 07.02.2022.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let idCell = "fileCeil"
    
    //var files: [File] = [File(title: "File1"), File(title: "File2")]
    var files: [File] = []
    
    @IBOutlet weak var tableView: UITableView!
    var PhotoPicker: UIImagePickerController!
    
    
    @IBAction func takePhoto(_ sender: Any) {
        
        PhotoPicker = UIImagePickerController()
        PhotoPicker.delegate = self
        PhotoPicker.sourceType = .camera
        PhotoPicker.allowsEditing = true
                
        present(PhotoPicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("didFinishPickingImage")
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let file = File(
                title: "Изображение с камеры",
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("\(indexPath.row)")
    }
}


