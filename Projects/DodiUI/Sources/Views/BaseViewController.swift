//
//  BaseViewController.swift
//  DodiUI
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import AsyncDisplayKit

open class BaseViewController: ASDKViewController<BaseNode>, BaseProxyDelegate {

  public override init() {
    super.init(node: BaseNode())
    self.node.delegate = self
  }

  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open func didLoad() {
    // override
  }

  open func layout() {
    // override
  }

  open func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    // override
    return ASLayoutSpec()
  }
}
