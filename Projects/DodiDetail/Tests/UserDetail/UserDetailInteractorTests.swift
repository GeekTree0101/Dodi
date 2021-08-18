//
//  UserDetailInteractorTests.swift
//  DodiDetailTests
//
//  Created by clean-swift-scaffold on 18/8/2021.
//  Copyright © 2021 Geektree0101. All rights reserved.
//

import XCTest

@testable import DodiDetail

final class UserDetailInteractorTests: XCTestCase {

  final class UserDetailPresenterSpy: UserDetailPresentationLogic {

    var presentLoadResponse: UserDetailModel.Load.Response?

    func presentLoad(response: UserDetailModel.Load.Response) {
      self.presentLoadResponse = response
    }

    var presentDeleteResponse: UserDetailModel.Delete.Response?

    func presentDelete(response: UserDetailModel.Delete.Response) {
      self.presentDeleteResponse = response
    }
  }

  // MARK: - Properties

  var presenter: UserDetailPresenterSpy!
  var interactor = UserDetailInteractor!

  override func setUp() {
    self.presenter = UserDetailPresenterSpy()
    self.interactor = UserDetailInteractor()
    self.interactor.presenter = self.presenter
  }
}

// MARK: - TODO TestName (BDD)

extension UserDetailInteractorTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}