//
//  List.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 08.02.2022.
//

import UIKit


protocol ListProtocol {
    var title: String { get set }
    var imageFile: UIImageView! { get set }
}


struct List: ListProtocol {
    var title: String
    var imageFile: UIImageView!
}
