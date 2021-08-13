//
//  Assembly.swift
//  DodiDetail
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation
import NeedleFoundation

import DodiRepository

public protocol DetailDependency: Dependency {

  var repositoryBuilder: RepositoryBuilder { get }
}

public protocol DetailBuilder {

  var editableDetailViewController: EditableDetailViewController { get }
}

public class DetailComponent: Component<DetailDependency>, DetailBuilder {

  public var editableDetailViewController: EditableDetailViewController {
    return EditableDetailViewController(
      dependency: EditableDetailViewController.Dependency(
        todoCachedRepository: self.repositoryBuilder.todoCachedRepository
      )
    )
  }
}
