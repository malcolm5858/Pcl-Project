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
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return DataExample.sharedInstance.Posts[indexPath.item]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HomeHeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [HomeFooterCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [PostCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return DataExample.sharedInstance.Posts.count
    }
    
    
}
