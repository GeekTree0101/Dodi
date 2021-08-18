//
//  UserDetailPresenter.swift
//  DodiDetail
//
//  Created by clean-swift-scaffold on 18/8/2021.
//  Copyright © 2021 Geektree0101. All rights reserved.
//

import UIKit

protocol UserDetailPresentationLogic: AnyObject {

  func presentLoad(response: UserDetailModel.Load.Response)
  func presentDelete(response: UserDetailModel.Delete.Response)
}

final class UserDetailPresenter {

  weak var viewController: UserDetailDisplayLogic?

}

// MARK: - Presentation Logic

extension UserDetailPresenter: UserDetailPresentationLogic {

  func presentLoad(response: UserDetailModel.Load.Response) {

  }

  func presentDelete(response: UserDetailModel.Delete.Response) {

  }
}