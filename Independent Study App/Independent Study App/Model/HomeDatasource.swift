//
//  HomeDatasource.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/18/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import Foundation
import LBTAComponents

class HomeDatasource: Datasource {
    
    
    let Posts: [Post] = {
        let Users: [User] = {
            let malcolmUser = User(username: "malcolm5858", profilePicture: #imageLiteral(resourceName: "MalcolmProfile"), bio: "TO TEst the bio")
            let robertUser = User(username: "Robert", profilePicture: #imageLiteral(resourceName: "RobertProfile"), bio: "bio...")
            let alexUser = User(username: "9Srting", profilePicture: #imageLiteral(resourceName: "AlexProfile"), bio: "9Srting")
            return [malcolmUser, robertUser, alexUser]
        }()
        let malcolmPost1 = Post(user: Users[0], caption: "first powerup", postImage: #imageLiteral(resourceName: "Nature1"))
        let malcolmPost2 = Post(user: Users[0], caption: "first powerup 2", postImage: #imageLiteral(resourceName: "Nature2"))
        let robertPost1 = Post(user: Users[1], caption: "robert", postImage: #imageLiteral(resourceName: "Robert1"))
        let alexPost1 = Post(user: Users[2], caption: "Colosseum", postImage: #imageLiteral(resourceName: "Alex1"))
        return [malcolmPost1, malcolmPost2, robertPost1, alexPost1]
    }()
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return Posts[indexPath.item]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HomeHeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [HomeFooterCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [PostCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return Posts.count
    }
    
    
}
