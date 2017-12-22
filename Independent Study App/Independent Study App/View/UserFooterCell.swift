//
//  UserFooterCell.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/20/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class UserFooterCell: DatasourceCell {
    
    
    let testLabel: UILabel = {
        let label = UILabel()
        label.text = "Footer"
        label.backgroundColor = .red
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(testLabel)
        
        testLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
}
