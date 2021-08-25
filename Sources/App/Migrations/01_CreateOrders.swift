import Fluent

struct CreateOrders: Migration {
  func prepare(on database: Database) -> Future<Void> {
    return database.schema("orders")
      .id()
      .field("email", .string, .required)
      .create()
  }

  func revert(on database: Database) -> Future<Void> {
    return database.schema("orders").delete()
  }
}
