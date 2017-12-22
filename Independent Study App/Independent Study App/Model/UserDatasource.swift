//
//  UserDatasource.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/19/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class UserDatasource: Datasource {
    
    var postAtIndex: Post?
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return postAtIndex
    }
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooterCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeaderCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
}
