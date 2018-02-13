//
//  DataExample.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 1/3/18.
//  Copyright © 2018 Malcolm Machesky. All rights reserved.
//

import Foundation

class DataExample {
    
    static let sharedInstance = DataExample()
    
    var Users: [User] = []
    var Posts : [Post] = []
    var currentUser: User?
    var postForUser: [[Post]]?
    
    private init() {
        Users = {
            let malcolmUser = User(username: "malcolm5858", profilePicture: #imageLiteral(resourceName: "MalcolmProfile"), bio: "TO TEst the bio")
            let robertUser = User(username: "Robert", profilePicture: #imageLiteral(resourceName: "RobertProfile"), bio: "bio...")
            let alexUser = User(username: "9Srting", profilePicture: #imageLiteral(resourceName: "AlexProfile"), bio: "9Srting")
            return [malcolmUser, robertUser, alexUser]
        }()
        
        Posts = {
            let malcolmPost1 = Post(user: Users[0], caption: "first powerup", postImage: #imageLiteral(resourceName: "Nature1"))
            let malcolmPost2 = Post(user: Users[0], caption: "first powerup 2", postImage: #imageLiteral(resourceName: "Nature2"))
            let robertPost1 = Post(user: Users[1], caption: "robert", postImage: #imageLiteral(resourceName: "Robert1"))
            let alexPost1 = Post(user: Users[2], caption: "Colosseum", postImage: #imageLiteral(resourceName: "Alex1"))
            return [malcolmPost1, malcolmPost2, robertPost1, alexPost1]
        }()
        
        currentUser = Users[0]
        
        postForUser = {
            let malcolmPosts = [Posts[0], Posts[1]]
            let robertPosts = [Posts[2]]
            let alexPosts = [Posts[3]]
            return [malcolmPosts, robertPosts, alexPosts]
        }()
    }
    
    

}
