//
//  SaveAndLoadData.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 3/28/18.
//  Copyright © 2018 Malcolm Machesky. All rights reserved.
//

import Foundation
import KituraKit

class SaveAndLoadData {
    
    //Data Arrays
    private var users: [User] = []
    public var posts: [Post] = []
    
    
    init() {
        
    }
    
    static let sharedInstance = SaveAndLoadData()
    
    public func getUsers() -> [User] {
        return users
    }
    
    public func getPosts() -> [Post] {
        return posts
    }
    
    public func saveUser(user: User) {
        guard let client = KituraKit(baseURL: "http://localhost:8080") else {
            print("Error creating Kitura Client")
            return
        }
        client.post("/users", data: user, respondWith: { (user: User?, error: Error?) in
            guard error == nil else {
                print("Error saving user to Kitura: \(error!)")
                return
            }
            self.users.append(user!)
            print("Saving user to Kitura succeeded")
            })
    }
    
    public func savePost(post: Post) {
        guard let client = KituraKit(baseURL: "http://localhost:8080") else {
            print("Error creating Kitura Client")
            return
        }
        client.post("/posts", data: post, respondWith: { (post: Post?, error: Error?) in
            guard error == nil else {
                print("Error saving post to Kitura: \(error!)")
                return
            }
            self.posts.append(post!)
            print("Saving post to Kitura succeeded")
        })
    }
    
    public func loadFromServer() {
        guard let client = KituraKit(baseURL: "http://localhost:8080") else {
            print("Error creating Kitura Client")
            return
            
        }
        client.get("/users"){ (users: [User]?, error: Error?) in
            guard error == nil else {
                print("Error saving users from Kitura: \(error!)")
                return
            }
            guard let users = users else {
                self.users = [User]()
                return
            }
            self.users = users
        }
        client.get("/posts") { (posts: [Post]?, error: Error?) in
            guard error == nil else {
                print("Error saving posts from Kitura: \(error!)")
                return
            }
            guard let posts = posts else {
                self.posts = [Post]()
                return
            }
            self.posts = posts
        }
    }
    
    
    public func deleteUserFromServer(user: User) {
        
    }
    
    
    
}
