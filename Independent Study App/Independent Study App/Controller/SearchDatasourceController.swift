//
//  SearchViewController.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/22/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class SearchDatasourceController: DatasourceController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.bounces = true
        self.collectionView?.alwaysBounceVertical = true
        
    }
    
    override init() {
        super.init()
        
        let searchDatasource = SearchDatasource()
        self.datasource = searchDatasource
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
