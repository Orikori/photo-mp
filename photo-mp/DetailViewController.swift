//
//  DetailViewController.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 02.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    var titleDetail = ""
    var textDetail = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currency.text = titleDetail
        self.rate.text = textDetail
        
        

        // Do any additional setup after loading the view.
    }
    


}
