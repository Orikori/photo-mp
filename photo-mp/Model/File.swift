//
//  File.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 18.02.2022.
//
import UIKit


protocol FileProtocol {
    var title: String { get set }
    var imageFile: UIImage! { get set }
}


struct File: FileProtocol {
    var title: String
    var imageFile: UIImage!
}
