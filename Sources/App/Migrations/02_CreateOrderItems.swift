import Fluent

struct CreateOrderItems: Migration {
  func prepare(on database: Database) -> Future<Void> {
    return database.schema("order_items")
      .id()
      .field(
        "order_id", .uuid, .required,
        .references("orders", "id", onDelete: .cascade)
      )
      .field("title", .string, .required)
      .create()
  }

  func revert(on database: Database) -> Future<Void> {
    return database.schema("order_items").delete()
  }
}
