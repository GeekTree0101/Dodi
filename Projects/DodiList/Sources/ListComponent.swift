//
//  Assembly.swift
//  DodiList
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation
import NeedleFoundation

import DodiRepository
import DodiDetail

public protocol ListDependency: Dependency {

  var repositoryBuilder: RepositoryBuilder { get }
  var detailBuilder: DetailBuilder { get }
}

public protocol ListBuilder {

  var homeListViewController: HomeListViewController { get }
}

public class ListComponent: Component<ListDependency>, ListBuilder {

  public var homeListViewController: HomeListViewController {
    return HomeListViewController(
      dependeny: HomeListViewController.Dependency(
        homeBloc: HomeListBlocImpl(
          dependency: HomeListBlocImpl.Dependency(
            todoCachedRepository: self.repositoryBuilder.todoCachedRepository,
            presenter: HomeListPresenter()
          )
        ),
        detailBuilder: self.detailBuilder
      )
    )
  }
}
