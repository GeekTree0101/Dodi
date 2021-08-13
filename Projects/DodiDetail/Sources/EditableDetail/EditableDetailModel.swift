//
//  EditableDetailModel.swift
//  DodiDetail
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import DodiCore

enum EditableDetailModel {

  enum Load {

    struct Request {

    }

    struct Response {
      let todo: Todo
    }

    struct ViewModel {
      let contentViewModel: EditableDetailNode.ViewModel
    }
  }

  enum Save {

    struct Request {
      let title: String
      let description: String
    }
  }
}
