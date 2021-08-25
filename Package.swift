// swift-tools-version:5.2
import PackageDescription

let package = Package(
  name: "graphql-kit-test-app",
  platforms: [
    .macOS(.v10_15)
  ],
  dependencies: [
    .package(
      url: "https://github.com/vapor/vapor.git",
      from: "4.48.3"
    ),
    .package(
      url: "https://github.com/vapor/fluent.git",
      from: "4.3.1"
    ),
    .package(
      url: "https://github.com/vapor/fluent-sqlite-driver.git",
      from: "4.0.0"
    ),
    .package(
      name: "GraphQLKit",
      url: "https://github.com/alexsteinerde/graphql-kit.git",
      from: "2.3.0"
    ),
  ],
  targets: [
    .target(
      name: "App",
      dependencies: [
        .product(name: "Fluent", package: "fluent"),
        .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
        .product(name: "Vapor", package: "vapor"),
        "GraphQLKit",
      ],
      swiftSettings: [
        .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
      ]
    ),
    .target(name: "Run", dependencies: [.target(name: "App")]),
    .testTarget(
      name: "AppTests",
      dependencies: [
        .target(name: "App"),
        .product(name: "XCTVapor", package: "vapor"),
      ]),
  ]
)
