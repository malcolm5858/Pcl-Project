//
//  PostCell.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/20/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class PostCell: DatasourceCell, UIGestureRecognizerDelegate {
    
    var post: Post?
    
    override var datasourceItem: Any? {
        didSet {
            guard let post = datasourceItem as? Post else { return }
            self.post = post
            let user: User = post.user
            nameLabel.text = user.username
            userPicture.image = Util.mInstance.RBResizeImage(image: user.profilePicture, targetSize: CGSize(width: 50, height: 50))
            postPicture.image = post.postImage
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(descriptor: UIFontDescriptor(), size: 10)
        //label.backgroundColor = .blue
        return label
    }()
    
    let userPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func addButtonTo(imageView: UIImageView) -> UIImageView {
        let imageView = imageView
        
        let UITapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappedUser(sender:)))
        UITapRecognizer.delegate = self
        imageView.addGestureRecognizer(UITapRecognizer)
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }
    
    let postPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    @objc func tappedUser(sender: UITapGestureRecognizer) {
        let controller = self.controller as? HomeDatasourceController
        controller?.pushUserVC(postAtIndex: post)
    }
    
    
    
    override func setupViews() {
        super.setupViews()
        //backgroundColor = .yellow
        
        addSubview(addButtonTo(imageView: userPicture))
        addSubview(nameLabel)
        addSubview(postPicture)
        
        
        userPicture.anchor(self.topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(userPicture.topAnchor, left: userPicture.rightAnchor , bottom: nil, right: self.rightAnchor, topConstant: 20, leftConstant: 5, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 10)
        postPicture.anchor(userPicture.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 500)
    }
}


