//
//  EditableDetailRouter.swift
//  DodiDetail
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

public protocol EditableDetailRouterLogic: AnyObject {

  func saved()
}

public protocol EditableDetailDataPassing: AnyObject {

  var dataStore: EditableDetailDataStore? { get set }
}

final class EditableDetailRouter: EditableDetailRouterLogic, EditableDetailDataPassing {

  var dataStore: EditableDetailDataStore?
  weak var viewController: EditableDetailViewController?

  func saved() {
    if let todo = self.dataStore?.todo {
      self.viewController?.awaitHandler?(
        .saved(todo: todo)
      )
    }
    self.viewController?.dismiss(animated: true, completion: nil)
  }
}
