//
//  Assembly.swift
//  DodiRepository
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation
import NeedleFoundation

public protocol RepositoryDependency: Dependency {

  var userDefaults: UserDefaults { get }
}

public protocol RepositoryBuilder {

  var todoCachedRepository: TodoCachedRepository { get }
}

public class RepositoryComponent: Component<RepositoryDependency>, RepositoryBuilder {

  public var todoCachedRepository: TodoCachedRepository {
    return shared {
      TodoCachedRepositoryImpl(
        userDefaults: self.userDefaults
      )
    }
  }

}
