import Fluent
import Foundation

struct SeedDb: Migration {
  func prepare(on database: Database) -> Future<Void> {
    let order = Order(id: UUID("FBF9C172-E57E-49A8-8806-85F6C923E55A")!, email: "foo@bar.com")
    return order.create(on: database).flatMap { _ in
      let item = OrderItem(orderId: order.id!, title: "My Item")
      return order.$items.create(item, on: database)
    }
  }

  func revert(on database: Database) -> Future<Void> {
    return database.eventLoop.makeSucceededVoidFuture()
  }
}
