//
//  BaseNode.swift
//  DodiUI
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import AsyncDisplayKit

protocol BaseProxyDelegate: AnyObject {

  func didLoad()
  func layout()
  func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
}

public final class BaseNode: ASDisplayNode {

  weak var delegate: BaseProxyDelegate?

  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
    self.backgroundColor = UIColor.systemBackground
  }

  public override func didLoad() {

    self.delegate?.didLoad()
  }

  public override func layout() {

    self.delegate?.layout()
  }

  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

    return self.delegate?.layoutSpecThatFits(constrainedSize) ?? ASLayoutSpec()
  }
}
