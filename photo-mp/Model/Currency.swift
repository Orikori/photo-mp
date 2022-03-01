//
//  Currency.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 25.02.2022.
//

import UIKit


protocol CurrencyProtocol {
    var title: String { get set }
    var rate: String { get set }
}


struct Currency: CurrencyProtocol {
    var title: String
    var rate: String
}
