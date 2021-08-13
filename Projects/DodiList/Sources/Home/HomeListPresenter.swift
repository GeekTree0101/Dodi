//
//  HomeListPresenter.swift
//  DodiList
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import DodiUI
import DodiCore

struct HomeListPresenter {

  func mapping(todos: [Todo]) -> [CardCellNode.ViewModel] {

    return todos.map {
      CardCellNode.ViewModel(
        id: $0.id,
        title: "Title: " + $0.title,
        description: "Description: " + $0.description
      )
    }
  }
}
