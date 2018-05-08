//
//  Api.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 4/13/18.
//  Copyright © 2018 Malcolm Machesky. All rights reserved.
//

import Foundation
import KituraKit


class Api {
    var users: [User] = []
    var posts: [Post] = []
    
    enum apiErrors: Error {
        case clientError
        case noUsersFound
        case unexpectedError
    }
    
    static let sharedInstance = Api()

    /**
     Gets a user with a specified username
     
     - Parameter name: the name of the desired user
     
     - Returns: The user with the specified username or a blank
     
     - throws:
        - client error if there is a problem creating the kitura client
        - no users found if there are no users in the user array
        - unexpected error if the update users function throws an unexpected error
     */
    func getUser(name: String) throws -> User {
        var foundUser: User = User(username: "", profilePicture: Data(), bio: "");
        
        do {
            try updateUsers()
            print("update users sucsessful")
        } catch apiErrors.clientError {
            throw apiErrors.clientError
        } catch {
            throw apiErrors.unexpectedError
        }
        
        if(users.count > 0) {
            for user in users {
                if (user.username == name) {
                    foundUser = user
                    break
                }
                else {
                    continue
                }
            }
        }else {
            throw apiErrors.noUsersFound
        }
        
        return foundUser
    }
    
    func updateUsers() throws {
        guard let client = KituraKit(baseURL: "http://localhost:8080") else {
            print("Error creating kitura client")
            throw apiErrors.clientError
        }
        client.get("/users") { (users: [User]?, error: Error?) in
            guard error == nil else {
                print("Error getting meal from kitura: \(error!)")
                return
            }
            guard let users = users else {
                self.users = [User]()
                return
            }
            self.users = users
        }
    }
    
    func updatePosts() throws {
        guard let client = KituraKit(baseURL: "http://localhost:8080") else {
            print("Error creating kitura client")
            throw apiErrors.clientError
        }
        client.get("/posts") { (posts: [Post]?, error: Error?) in
            guard error == nil else {
                print("Error getting meal from kitura: \(error!)")
                return
            }
            guard let posts = posts else {
                self.posts = [Post]()
                return
            }
            self.posts = posts
        }
    }
    
    func getUsers() throws -> [User] {
        do {
            try updateUsers()
            print("update users sucsessful")
        } catch apiErrors.clientError {
            throw apiErrors.clientError
        } catch {
            throw apiErrors.unexpectedError
        }
        return self.users
    }
    
    func getPosts() throws -> [Post] {
        do {
            try updatePosts()
            print("update posts sucsessful")
        } catch apiErrors.clientError {
            throw apiErrors.clientError
        } catch {
            throw apiErrors.unexpectedError
        }
        return self.posts

    }
    
    //TODO: if you ever scale fix this function it querys all posts to find posts by a user
    func getPostsByUser(user: User) throws -> [Post] {
        var postsByUser: [Post] = []
        do {
            try updatePosts()
            print("update posts sucsessful")
        } catch apiErrors.clientError {
            throw apiErrors.clientError
        } catch {
            throw apiErrors.unexpectedError
        }
        
        for post in posts {
            if post.user == user {
                postsByUser.append(post)
                continue
            } else {
                continue
            }
        }
        
        return postsByUser
    }
    
    
    
    
    
    
    
    
}
