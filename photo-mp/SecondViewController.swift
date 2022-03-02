//
//  SecondViewController.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 18.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON


class SecondViewController: UIViewController {
    
    let idCell = "SecondViewCell"
    let source = "http://data.fixer.io/api/latest"
    let key = "6995b6761f17972a65482c529847b900"
    let base = "EUR"
    let currency = "USD,RUB"
    
    var titleDetail = ""
    var textDetail = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [Currency] = []

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        titleDetail = list[indexPath.row].title
        textDetail = list[indexPath.row].rate
        
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailController = segue.destination as? DetailViewController {

            detailController.titleDetail = titleDetail
            detailController.textDetail = textDetail
        }
    }
    
    func getPrice(url: String, parameters: [String: String]) {
        AF.request(url, parameters: parameters).responseJSON {response in
            switch response.result {
                case .success(let value):
                let json = JSON(value)
                    self.getRates(json: json)
                    break
                case .failure(let error):
                    print(error)
            }
            
            self.tableView.reloadData()
        }

    }
    
    func getRates(json: JSON) {
        for (name, price) in json["rates"] {
            let curr = Currency(
                title: name,
                rate: price.stringValue
            )
            list.append(curr)
        }
        
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
        
        cell.title.text = list[indexPath.row].title
        cell.body.text = list[indexPath.row].rate
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "EUR"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
}
