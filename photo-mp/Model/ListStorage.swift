//
//  ListStorage.swift
//  photo-mp
//
//  Created by Дмитрий Артемьев on 08.02.2022.
//



protocol ListStorageProtocol {
    func loadList() -> [ListProtocol]
    
}


class ListStorage: ListStorageProtocol {
    func loadList() -> [ListProtocol] {
        
        let test: [ListProtocol] = [
            List(title: "Купить хлеб" ),
            List(title: "Купить хлеб" ),
            List(title: "Купить хлеб" ),
            List(title: "Купить хлеб" ),
            List(title: "Купить хлеб" ),
            List(title: "Купить хлеб" ),
        ]
        
        
        return test
    }
    
}



