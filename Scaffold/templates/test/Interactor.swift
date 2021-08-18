//
//  __SCENE_NAME__InteractorTests.swift
//  __TARGET_PROJECT_NAME__Tests
//
//  Created by clean-swift-scaffold on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import XCTest

@testable import __TARGET_PROJECT_NAME__

final class __SCENE_NAME__InteractorTests: XCTestCase {

  final class __SCENE_NAME__PresenterSpy: __SCENE_NAME__PresentationLogic {

// clean-swift-scaffold-generate-presenter-spy (do-not-remove-comments)
  }

  // MARK: - Properties

  var presenter: __SCENE_NAME__PresenterSpy!
  var interactor = __SCENE_NAME__Interactor!

  override func setUp() {
    self.presenter = __SCENE_NAME__PresenterSpy()
    self.interactor = __SCENE_NAME__Interactor()
    self.interactor.presenter = self.presenter
  }
}

// MARK: - TODO TestName (BDD)

extension __SCENE_NAME__InteractorTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}