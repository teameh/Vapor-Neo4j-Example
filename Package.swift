// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Vapor-Neo4j-Api",
    products: [
        .library(name: "Vapor-Neo4j-Api", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        .package(url: "https://github.com/teameh/Neo4j-swift.git", .branch("4.0.2-revived")),
        .package(url: "https://github.com/teameh/Bolt-swift.git", .branch("1.0.2-swift-tools-4")),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite", "Vapor", "Theo", "Bolt"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

