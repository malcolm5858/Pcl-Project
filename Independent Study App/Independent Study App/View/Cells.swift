//
//  Cells.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/18/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import Foundation
import LBTAComponents

class PostCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = . blue
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
        addSubview(nameLabel)
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class FooterCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            
        }
    }
    
    override func setupViews() {
        
    }
}

class HeaderCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            
        }
    }
    
    override func setupViews() {
        
    }
    
}
