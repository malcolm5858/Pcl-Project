//
//  CreatePostCell.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/22/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class CreatePostCell: DatasourceCell, UICollectionViewDelegate {
    
    let imageToPost: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let listOfPictures: UICollectionView = {
       let collectionView = UICollectionView()
        
       return collectionView
    }()
    
    
    override func setupViews() {
        listOfPictures.delegate = self
        //MARK: add view's to the main view
        addSubview(imageToPost)
        addSubview(listOfPictures)
        //MARK: anchor the subViews
        
   }
    
}
