//
//  TodoRepository.swift
//  DodiRepository
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

public protocol TodoRepository {

  func todo(id: Int) -> Todo?
  func appendTodo(_ todo: Todo)
  func insertTodo(_ todo: Todo, at index: Int)
  func allTodos() -> [Todo]
  func save(_ todos: [Todo])
  func update(_ todo: Todo)
}
