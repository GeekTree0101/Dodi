//
//  __SCENE_NAME__ViewControllerTests.swift
//  __TARGET_PROJECT_NAME__Tests
//
//  Created by clean-swift-scaffold on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import XCTest

@testable import __TARGET_PROJECT_NAME__

final class __SCENE_NAME__ViewControllerTests: XCTestCase {

  // MARK: - Test Double Objects

  final class __SCENE_NAME__InteractorSpy: __SCENE_NAME__BusinessLogic {

// clean-swift-scaffold-generate-business-spy (do-not-remove-comments)
  }

  final class __SCENE_NAME__RouterSpy: __SCENE_NAME__RoutingLogic, __SCENE_NAME__DataPassing {

    var dataStore: __SCENE_NAME__DataStore?

  }

  // MARK: - Properties

  var interactor: __SCENE_NAME__InteractorSpy!
  var router: __SCENE_NAME__RouterSpy!
  var viewController: __SCENE_NAME__ViewController!

  override func setUp() {
    self.interactor = __SCENE_NAME__InteractorSpy()
    self.router = __SCENE_NAME__RouterSpy()
    self.viewController = __SCENE_NAME__ViewController()

    self.viewController.interactor = self.interactor
    self.viewController.router = self.router
  }

}

// MARK: - TODO TestName (BDD)

extension __SCENE_NAME__ViewControllerTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}