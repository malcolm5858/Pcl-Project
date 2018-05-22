import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import SwiftKueryORM



public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()
extension User: Model { }
extension Post: Model { }

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()
   
    private var userStore: [String: User] = [:]
    private var postStore: [String: Post] = [:]

    public init() throws {
        // Run the metrics initializer
        initializeMetrics(router: router)
    }
    
    func postInit() throws {
        // Endpoints
        router.post("/users", handler: storeHandlerUser)
        router.get("/users", handler: loadHandlerUser)
        router.post("/posts", handler: storeHandlerPost)
        router.get("/posts", handler: loadHandlerPost)
        /*
        Persistence.setUp()
        do {
            try User.createTableSync()
        } catch let error {
            print(error)
        }
 */
        
        initializeHealthRoutes(app: self)
    }
    
    func storeHandlerUser(user: User, completion:  (User?, RequestError?) -> Void) {
        userStore[user.username] = user
        completion(userStore[user.username], nil)
        //user.save(completion)
    }
    
    func loadHandlerUser(completion:  ([User]?, RequestError?) -> Void) {
        //User.findAll(completion)
        let users: [User] = self.userStore.map({ $0.value })
        completion(users, nil)
    }
    
    func storeHandlerPost(post: Post, completion:  (Post?, RequestError?) -> Void) {
        postStore[post.caption] = post
        completion(postStore[post.caption], nil)
        //post.save(completion)
    }
    
    func loadHandlerPost(completion:  ([Post]?, RequestError?) -> Void) {
        //Post.findAll(completion)
        let posts: [Post] = self.postStore.map({ $0.value })
        completion(posts, nil)
    }
    
    
    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
    
    
}


class Persistence {
    
    
    
}
