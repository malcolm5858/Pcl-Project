//
//  UserDatasourceController.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/19/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class UserDatasourceController: DatasourceController {
    
    
    var postAtIndex: Post?
    
    override init() {
        super.init()
        
        let userDatasource = UserDatasource()
        self.datasource = userDatasource
        
        setupNavagationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.bounces = true
        self.collectionView?.alwaysBounceVertical = true
        
        
    }
    
    func setupNavagationBar() {
        //TODO: look at this 
        let customBackButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        customBackButton.title = " "
        self.navigationItem.backBarButtonItem = customBackButton
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 550)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
