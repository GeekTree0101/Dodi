//
//  EditableDetailInteractor.swift
//  DodiDetail
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import DodiRepository
import DodiCore

protocol EditableDetailInteractorLogic: AnyObject {

  func load(_ request: EditableDetailModel.Load.Request)
  func save(_ request: EditableDetailModel.Save.Request)
}

public protocol EditableDetailDataStore: AnyObject {

  var todoID: Int { get set }
  var todo: Todo? { get }
}

final class EditableDetailInteractor: EditableDetailInteractorLogic, EditableDetailDataStore {

  struct Dependency {
    let todoCachedRepository: TodoCachedRepository
    let presenter: EditableDetailPresenterLogic
  }

  var todoID: Int = -1

  private let dependency: Dependency
  internal var todo: Todo?

  init(dependency: Dependency) {
    self.dependency = dependency
  }

  func load(_ request: EditableDetailModel.Load.Request) {

    guard let todo = self.dependency.todoCachedRepository.todo(id: self.todoID) else { return }

    self.todo = todo

    self.dependency.presenter.load(
      EditableDetailModel.Load.Response(
        todo: todo
      )
    )
  }

  func save(_ request: EditableDetailModel.Save.Request) {

    self.todo?.title = request.title
    self.todo?.description = request.description

    guard let savedTodo = self.todo else { return }

    self.dependency.todoCachedRepository.update(savedTodo)
  }
}
