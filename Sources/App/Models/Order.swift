import Fluent
import Vapor

final class Order: Model, Content {
  static let schema = "orders"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "email")
  var email: String

  @Children(for: \OrderItem.$order)
  var items: [OrderItem]

  init() {}

  init(id: UUID? = nil, email: String) {
    self.id = id
    self.email = email
  }
}
