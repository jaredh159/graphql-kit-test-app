import Fluent
import FluentSQLiteDriver
import GraphQLKit
import Vapor

typealias Future = EventLoopFuture

public func configure(_ app: Application) throws {
  app.databases.use(.sqlite(.memory), as: .sqlite)

  app.migrations.add(CreateOrders())
  app.migrations.add(CreateOrderItems())
  app.migrations.add(SeedDb())
  try app.autoMigrate().wait()

  app.register(graphQLSchema: AppSchema, withResolver: Resolver())

  app.logger.notice("App environment is `\(app.environment.name)`")
}
