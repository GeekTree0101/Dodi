//
//  UserDetailInteractor.swift
//  DodiDetail
//
//  Created by clean-swift-scaffold on 18/8/2021.
//  Copyright © 2021 Geektree0101. All rights reserved.
//

import Foundation

protocol UserDetailBusinessLogic: AnyObject {

  func load(request: UserDetailModel.Load.Request)
  func delete(request: UserDetailModel.Delete.Request)
}

protocol UserDetailDataStore: AnyObject {

}

final class UserDetailInteractor: UserDetailDataStore {

  var presenter: UserDetailPresentationLogic?

}

// MARK: - Business Logic

extension UserDetailInteractor: UserDetailBusinessLogic {

  func load(request: UserDetailModel.Load.Request) {

  }

  func delete(request: UserDetailModel.Delete.Request) {

  }
}