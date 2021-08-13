//
//  TodoCachedRepositoryImpl.swift
//  DodiRepository
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import DodiCore

struct TodoCachedRepositoryImpl: TodoCachedRepository {

  private enum Const {

    static let todosKey: String = "TodoCachedRepository.todos"
  }

  private let userDefaults: UserDefaults

  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
  }

  func todo(id: Int) -> Todo? {

    let todos = self.cachedTodos()
    return todos.first(where: { $0.id == id })
  }

  func appendTodo(_ todo: Todo) {

    var todos = self.cachedTodos()
    todos.append(todo)
    self.save(todos)
  }

  func insertTodo(_ todo: Todo, at index: Int) {

    var todos = self.cachedTodos()
    todos.insert(todo, at: index)
    self.save(todos)
  }

  func save(_ todos: [Todo]) {
    guard let jsonString = try? PropertyListEncoder().encode(todos) else { return }
    self.userDefaults.setValue(jsonString, forKey: Const.todosKey)
  }

  func allTodos() -> [Todo] {

    return self.cachedTodos()
  }

  func update(_ todo: Todo) {
    var todos = self.cachedTodos()
    guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }

    todos[index] = todo
    self.save(todos)
  }

  private func cachedTodos() -> [Todo] {
    guard let data = self.userDefaults.value(forKey: Const.todosKey) as? Data,
          let todos = try? PropertyListDecoder().decode([Todo].self, from: data) else { return [] }
    return todos
  }
}
