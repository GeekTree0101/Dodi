//
//  __SCENE_NAME__Interactor.swift
//  __TARGET_PROJECT_NAME__
//
//  Created by clean-swift-scaffold on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import Foundation

protocol __SCENE_NAME__BusinessLogic: AnyObject {

// clean-swift-scaffold-generate-business-interface (do-not-remove-comments)
}

protocol __SCENE_NAME__DataStore: AnyObject {

}

final class __SCENE_NAME__Interactor: __SCENE_NAME__DataStore {

  var presenter: __SCENE_NAME__PresentationLogic?

}

// MARK: - Business Logic

extension __SCENE_NAME__Interactor: __SCENE_NAME__BusinessLogic {

// clean-swift-scaffold-generate-business-implementation (do-not-remove-comments)
}