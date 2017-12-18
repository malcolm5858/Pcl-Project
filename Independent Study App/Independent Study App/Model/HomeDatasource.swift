//
//  HomeDatasource.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/18/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import Foundation
import LBTAComponents

class HomeDatasource: Datasource {
    let words = ["user1", "user2", "user3"]
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [PostCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    
    
}
