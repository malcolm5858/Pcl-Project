//
//  ProfileDatasource.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/22/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class ProfileDatasource: Datasource {
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return DataExample.sharedInstance.currentUser
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [ProfileHeaderCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ProfileCell.self]
    }
    
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
}
