//
//  UserDetailViewController.swift
//  DodiDetail
//
//  Created by clean-swift-scaffold on 18/8/2021.
//  Copyright © 2021 Geektree0101. All rights reserved.
//

import UIKit

protocol UserDetailDisplayLogic: AnyObject {

  func displayLoad(viewModel: UserDetailModel.Load.ViewModel)
  func displayDelete(viewModel: UserDetailModel.Delete.ViewModel)
}

final class UserDetailViewController: UIVIewController {

  // MARK: - Properties

  var router: (UserDetailRoutingLogic & UserDetailDataPassing)?
  var interactor: UserDetailBusinessLogic?

  // MARK: - Initializing

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.configure()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Configuring

  private func configure() {
    let viewController = self
    let interactor = UserDetailInteractor()
    let presenter = UserDetailPresenter()
    let router = UserDetailRouter()

    interactor.presenter = presenter

    presenter.view = viewController

    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
  }
}

// MARK: - Display Logic

extension UserDetailViewController: UserDetailDisplayLogic {

  func displayLoad(viewModel: UserDetailModel.Load.ViewModel) {

  }

  func displayDelete(viewModel: UserDetailModel.Delete.ViewModel) {

  }
}