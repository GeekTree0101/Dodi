//
//  RootComponent.swift
//  Dodi
//
//  Created by Geektree0101 on 2021/08/13.
//  Copyright © 2021 com.dodi. All rights reserved.
//

import Foundation
import NeedleFoundation

import DodiList
import DodiDetail

import DodiRepository

class RootComponent: BootstrapComponent {

  var userDefaults: UserDefaults {
    return shared { UserDefaults.standard }
  }

  var repositoryBuilder: RepositoryBuilder {
    return shared { RepositoryComponent(parent: self) }
  }

  var listBuilder: ListBuilder {
    return shared { ListComponent(parent: self) }
  }

  var detailBuilder: DetailBuilder {
    return shared { DetailComponent(parent: self) }
  }

  var rootViewController: UIViewController {
    return UINavigationController(
      rootViewController: self.listBuilder.homeListViewController
    )
  }
}
