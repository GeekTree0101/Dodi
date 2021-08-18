//
//  UserDetailPresenterTests.swift
//  DodiDetailTests
//
//  Created by clean-swift-scaffold on 18/8/2021.
//  Copyright © 2021 Geektree0101. All rights reserved.
//

import XCTest

@testable import DodiDetail

final class UserDetailPresenterTests: XCTestCase {

  // MARK: - Test Double Objects

  final class UserDetailDisplaySpy: UserDetailDisplayLogic {

    var displayLoadViewModel: UserDetailModel.Load.ViewModel?

    func displayLoad(viewModel: UserDetailModel.Load.ViewModel) {
      self.displayLoadViewModel = viewModel
    }

    var displayDeleteViewModel: UserDetailModel.Delete.ViewModel?

    func displayDelete(viewModel: UserDetailModel.Delete.ViewModel) {
      self.displayDeleteViewModel = viewModel
    }
  }

  // MARK: - Properties

  var presenter: UserDetailPresenter!
  var display: UserDetailDisplaySpy!

  override func setUp() {
    self.presenter = UserDetailPresenter()
    self.display = UserDetailDisplaySpy()
    self.presenter.viewController = self.display
  }
}


// MARK: - TODO TestName (BDD)

extension UserDetailPresenterTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}