import Fluent
import Foundation
import Graphiti
import Vapor

final class Resolver {
  struct IdentifyEntityArgs: Codable {
    let id: UUID
  }

  func getOrder(
    request: Request,
    args: IdentifyEntityArgs
  ) throws -> Future<Order> {
    return Order.query(on: request.db)
      .with(\.$items)
      .filter(\.$id == args.id)
      .first()
      .unwrap(or: Abort(.notFound))
  }
}
