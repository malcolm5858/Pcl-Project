//
//  SearchDatasource.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/22/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class SearchDatasource: Datasource {
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [SearchCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
    
}
