//
//  HomeDatasourceController.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/13/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents


class HomeDatasourceController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        
        self.collectionView?.bounces = true
        self.collectionView?.alwaysBounceVertical = true
        
        
        
        
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
    func pushUserVC(postAtIndex: Post?){
        let UserVC = UserDatasourceController()
        guard let datasource: UserDatasource = UserVC.datasource as? UserDatasource else {
            print("Error at pushUserVC")
            return
        }
        setupNavagationBar()
        datasource.postAtIndex = postAtIndex
        self.navigationController?.pushViewController(UserVC, animated: true)
    }
    
    func setupNavagationBar() {
        let customBackButton = UIBarButtonItem()
        self.navigationController?.view.tintColor = UIColor.black
        self.navigationItem.backBarButtonItem = customBackButton
    }
    
    
}
