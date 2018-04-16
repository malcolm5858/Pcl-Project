//
//  ProfileHeaderCell.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/22/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class ProfileHeaderCell: DatasourceCell {
    
    var user: User?
    
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            userPicture.image = Util.mInstance.RBResizeImage(image: UIImage(data: user.profilePicture)! , targetSize: CGSize(width: 100, height: 100))
            
        }
    }
    
    let userPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let postsView: ProfileStatsView = {
        let postView = ProfileStatsView()
        return postView
    }()
    
    
    
    
    override func setupViews() {
        user = DataExample.sharedInstance.currentUser
        super.setupViews()
    
        //MARK: addSubview
        addSubview(userPicture)
        addSubview(postsView)
        
        //MARK: Anchor
        userPicture.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: postsView.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        postsView.anchor(self.topAnchor, left: userPicture.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: self.contentView.bounds.width - 100, heightConstant: 0)
        
    }
    
    
}
