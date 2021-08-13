//
//  EditableDetailPresenter.swift
//  DodiDetail
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

protocol EditableDetailPresenterLogic: AnyObject {

  func load(_ response: EditableDetailModel.Load.Response)
}

final class EditableDetailPresenter: EditableDetailPresenterLogic {

  weak var viewController: EditableDetailDisplayLogic?
  
  func load(_ response: EditableDetailModel.Load.Response) {

    self.viewController?.load(
      EditableDetailModel.Load.ViewModel(
        contentViewModel: EditableDetailNode.ViewModel(
          title: response.todo.title,
          description: response.todo.description
        )
      )
    )
  }
}
