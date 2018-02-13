//
//  ProfileStatsView.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 1/4/18.
//  Copyright © 2018 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class ProfileStatsView: UIView {
    
    //MARK: Views
    let postAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SanFranciscoDisplay-Bold ", size: 10)
        label.text = "100"
        return label
    }()
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SanFranciscoRounded-Ultralight ", size: 3)
        label.textColor = .gray
        label.text = "posts"
        return label
    }()
    
    let followersAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SanFranciscoDisplay-Bold ", size: 10)
        label.text = "100"
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SanFranciscoRounded-Ultralight ", size: 3)
        label.textColor = .gray
        label.text = "followers"
        return label
    }()
    
    let followingAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SanFranciscoDisplay-Bold ", size: 10)
        label.text = "100"
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SanFranciscoRounded-Ultralight ", size: 3)
        label.textColor = .gray
        label.text = "following"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        //MARK: addSubview
        addSubview(postAmountLabel)
        addSubview(postLabel)
        addSubview(followersAmountLabel)
        addSubview(followersLabel)
        addSubview(followingAmountLabel)
        addSubview(followingLabel)
        
        //TODO: If this goes public change the constant to equation right now its set for iphone 8+
        let bottomConstant: CGFloat = 20
        let topConstant: CGFloat = 20
        let leftConstant: CGFloat = 30
        let rightConstant: CGFloat = 30
        let centerConstant: CGFloat = 60
        let bottomLeftConstant: CGFloat = 30
        let bottomRightConstant: CGFloat = 20
        //TODO: finish this shit view
        //MARK: Anchor
        postAmountLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        postLabel.anchor(postAmountLabel.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: topConstant, leftConstant: bottomLeftConstant, bottomConstant: bottomConstant, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followersAmountLabel.anchor(self.topAnchor, left: postAmountLabel.rightAnchor, bottom: nil, right: nil, topConstant: topConstant, leftConstant: centerConstant, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followersLabel.anchor(followersAmountLabel.bottomAnchor, left: postLabel.rightAnchor, bottom: self.bottomAnchor, right: nil, topConstant: topConstant, leftConstant: bottomLeftConstant, bottomConstant: bottomConstant, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followingAmountLabel.anchor(self.topAnchor, left: followersAmountLabel.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: topConstant, leftConstant: centerConstant, bottomConstant: 0, rightConstant: rightConstant, widthConstant: 0, heightConstant: 0)
        followingLabel.anchor(followingAmountLabel.bottomAnchor, left: followersLabel.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: topConstant, leftConstant: bottomLeftConstant, bottomConstant: bottomConstant, rightConstant: bottomRightConstant, widthConstant: 0, heightConstant: 0)
    }
}
