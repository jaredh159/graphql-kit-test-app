import Fluent
import Foundation
import Graphiti
import Vapor

let AppSchema = try! Graphiti.Schema<Resolver, Request> {
  Scalar(UUID.self)

  Type(Order.self) {
    Field("id", at: \.id)
    Field("email", at: \.email)
    Field("items", with: \.$items)
  }

  Type(OrderItem.self) {
    Field("title", at: \.title)
    Field("order", with: \.$order)
  }

  Query {
    Field("getOrder", at: Resolver.getOrder) {
      Argument("id", at: \.id)
    }
  }
}
