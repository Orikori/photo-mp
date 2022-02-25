//
//  SecondViewController.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 18.02.2022.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    
    let idCell = "SecondViewCell"
    let source = "http://data.fixer.io/api/latest"
    let key = "6995b6761f17972a65482c529847b900"
    let base = "EUR"
    let currency = "USD,RUB"
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params = [
            "access_key": key,
            "base": base,
            "symbols": currency
        ]
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellTypeNib = UINib(nibName: "SecondViewCell", bundle: nil)
        tableView.register(cellTypeNib, forCellReuseIdentifier: "SecondViewCell")
        
        getPrice(url: source, parameters: params)

        // Do any additional setup after loading the view.
    }
    
}

func getPrice(url: String, parameters: [String: String]) {
    AF.request(url, parameters: parameters).responseJSON {response in
        print(response)
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
        return "EUR"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
}
