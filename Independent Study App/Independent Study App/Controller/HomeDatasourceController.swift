//
//  HomeDatasourceController.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/13/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

//TODO: Create the collection view to specs of the app and achoring

class HomeDatasourceController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        
    }
    
    
}
