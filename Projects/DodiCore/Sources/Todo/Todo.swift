import Foundation

import Then

public struct Todo: Codable, Hashable, Then {

  public let id: Int
  public var title: String
  public var description: String

  public init(id: Int, title: String, description: String) {
    self.id = id
    self.title = title
    self.description = description
  }
}
