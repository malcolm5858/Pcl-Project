//
//  UserCell.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/20/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let post = datasourceItem as? Post else {return}
            let user = post.user
            userPicture.image = UIImage(data: user.profilePicture)
        }
    }
    
    let userPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        return imageView
    }()
    
    
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(userPicture)
        
        userPicture.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
}
