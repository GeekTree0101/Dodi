//
//  HomeListBloc.swift
//  DodiList
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import DeepDiff

import DodiUI
import DodiRepository
import DodiCore

protocol HomeListAction {

  func reload()
  func update(_ todo: Todo)
}

protocol HomeListRender: AnyObject {

  func reload(_ items: [CardCellNode.ViewModel])
  func update(_ updatedItems: [CardCellNode.ViewModel])
}

protocol HomeListBloc: HomeListAction {

  func addRender(render: HomeListRender)
}

final class HomeListBlocImpl: HomeListBloc {

  struct Dependency {
    let todoCachedRepository: TodoCachedRepository
    let presenter: HomeListPresenter
  }

  private let dependency: Dependency
  private weak var render: HomeListRender?

  private var todos: [Todo] = []

  init(dependency: Dependency) {
    self.dependency = dependency
  }

  func addRender(render: HomeListRender) {
    self.render = render
  }

  func reload() {

    self.todos = self.dependency.todoCachedRepository.allTodos()
    self.render?.reload(
      self.dependency.presenter.mapping(
        todos: self.todos
      )
    )
  }

  func update(_ todo: Todo) {
    guard let index = self.todos.firstIndex(where: { $0.id == todo.id }) else { return }
    self.todos[index] = todo
    self.render?.update(
      self.dependency.presenter.mapping(
        todos: self.todos
      )
    )
  }
}
