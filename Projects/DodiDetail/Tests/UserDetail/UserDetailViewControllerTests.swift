//
//  UserDetailViewControllerTests.swift
//  DodiDetailTests
//
//  Created by clean-swift-scaffold on 18/8/2021.
//  Copyright © 2021 Geektree0101. All rights reserved.
//

import XCTest

@testable import DodiDetail

final class UserDetailViewControllerTests: XCTestCase {

  // MARK: - Test Double Objects

  final class UserDetailInteractorSpy: UserDetailBusinessLogic {

    var loadRequest: UserDetailModel.Load.Request?

    func load(request: UserDetailModel.Load.Request) {
      self.loadRequest = request
    }

    var deleteRequest: UserDetailModel.Delete.Request?

    func delete(request: UserDetailModel.Delete.Request) {
      self.deleteRequest = request
    }
  }

  final class UserDetailRouterSpy: UserDetailRoutingLogic, UserDetailDataPassing {

    var dataStore: UserDetailDataStore?

  }

  // MARK: - Properties

  var interactor: UserDetailInteractorSpy!
  var router: UserDetailRouterSpy!
  var viewController: UserDetailViewController!

  override func setUp() {
    self.interactor = UserDetailInteractorSpy()
    self.router = UserDetailRouterSpy()
    self.viewController = UserDetailViewController()

    self.viewController.interactor = self.interactor
    self.viewController.router = self.router
  }

}

// MARK: - TODO TestName (BDD)

extension UserDetailViewControllerTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}