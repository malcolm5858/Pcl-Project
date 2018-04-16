import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health
import SwiftKueryORM
import SwiftKueryPostgreSQL


public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()
extension User: Model { }
extension Post: Model { }

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()
   

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
        Persistence.setUp()
        do {
            try User.createTableSync()
        } catch let error {
            print(error)
        }
        
        initializeHealthRoutes(app: self)
    }
    
    func storeHandlerUser(user: User, completion: @escaping (User?, RequestError?) -> Void) {
        user.save(completion)
    }
    
    func loadHandlerUser(completion: @escaping ([User]?, RequestError?) -> Void) {
        User.findAll(completion)
    }
    
    func storeHandlerPost(post: Post, completion: @escaping (Post?, RequestError?) -> Void) {
        post.save(completion)
    }
    
    func loadHandlerPost(completion: @escaping ([Post]?, RequestError?) -> Void) {
        Post.findAll(completion)
    }
    
    
    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
    
    
}


class Persistence {
    
    static func setUp() {
        let pool = PostgreSQLConnection.createPool(host: "localhost", port: 5432, options: [.databaseName("socialMediaAppDatabase")], poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50, timeout: 10000))
        Database.default = Database(pool)
    }
    
}
