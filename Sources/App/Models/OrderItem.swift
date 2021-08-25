import Fluent
import Vapor

final class OrderItem: Model, Content {
  static let schema = "order_items"

  @ID(key: .id)
  var id: UUID?

  @Parent(key: "order_id")
  var order: Order

  @Field(key: "title")
  var title: String

  init() {}

  init(id: UUID? = nil, orderId: UUID? = nil, title: String) {
    self.id = id
    if let orderId = orderId {
      self.$order.id = orderId
    }
    self.title = title
  }
}
