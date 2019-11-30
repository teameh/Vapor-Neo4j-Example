import Vapor
import Theo

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req -> String in

        let client = try BoltClient()
        // let client = try BoltClient()
        let result = client.connectSync()

        switch result {
        case .failure(_):
            return "Error while connecting to Neo4j"
        case .success(_):
            return "Connected to Neo4j!"
        }
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
