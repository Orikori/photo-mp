//
//  SecondViewController.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 18.02.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let idCell = "SecondViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [String] = ["111", "222", "333"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellTypeNib = UINib(nibName: "SecondViewCell", bundle: nil)
        tableView.register(cellTypeNib, forCellReuseIdentifier: "SecondViewCell")

        // Do any additional setup after loading the view.
    }
    
}



extension SecondViewController:UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondViewCell", for: indexPath) as! SecondViewCell
        
        cell.title.text = list[indexPath.row]
        cell.body.text = list[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "https://jsonplaceholder.typicode.com/posts/"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
}
