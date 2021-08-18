//
//  UserDetailRouter.swift
//  DodiDetail
//
//  Created by clean-swift-scaffold on 18/8/2021.
//  Copyright © 2021 Geektree0101. All rights reserved.
//

import UIKit

protocol UserDetailRoutingLogic: AnyObject {

}

protocol UserDetailDataPassing: AnyObject {

  var dataStore: UserDetailDataStore? { get set }
}

final class UserDetailRouter: UserDetailDataPassing {

  weak var viewController: UserDetailViewController?
  var dataStore: UserDetailDataStore?

}

// MARK: - Routing Logic

extension UserDetailRouter: UserDetailRoutingLogic {

}