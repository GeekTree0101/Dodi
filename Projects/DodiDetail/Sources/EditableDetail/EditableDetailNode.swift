//
//  EditableDetailNode.swift
//  DodiDetail
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import Then

import DodiUI

final class EditableDetailNode: ASDisplayNode {

  private enum Typo {

    static let indicator = StringStyle(
      .font(UIFont.boldSystemFont(ofSize: 14.0)),
      .color(UIColor.darkGray)
    )

    static let titlePlaceHolder = StringStyle(
      .font(UIFont.boldSystemFont(ofSize: 30.0)),
      .color(UIColor.gray)
    )

    static let descPlaceHolder = StringStyle(
      .font(UIFont.systemFont(ofSize: 24.0)),
      .color(UIColor.gray)
    )

    static let title = StringStyle(
      .font(UIFont.boldSystemFont(ofSize: 30.0)),
      .color(UIColor.black)
    )

    static let desc = StringStyle(
      .font(UIFont.systemFont(ofSize: 24.0)),
      .color(UIColor.black)
    )
  }

  struct ViewModel {
    let title: String
    let description: String
  }

  // MARK: - UI

  private let titleIndicatorNode = ASTextNode().then {
    $0.attributedText = "Title".styled(with: Typo.indicator)
  }
  
  private let titleNode = ASEditableTextNode().then {
    $0.attributedPlaceholderText = "Title...".styled(with: Typo.titlePlaceHolder)
    $0.typingAttributes = Typo.title.attributes.toStringWithAny
  }

  private let descriptionIndicatorNode = ASTextNode().then {
    $0.attributedText = "Description".styled(with: Typo.indicator)
  }

  private let descriptionNode = ASEditableTextNode().then {
    $0.attributedPlaceholderText = "Description...".styled(with: Typo.descPlaceHolder)
    $0.typingAttributes = Typo.desc.attributes.toStringWithAny
  }

  var currentTitle: String? {
    return self.titleNode.attributedText?.string
  }

  var currentDescription: String? {
    return self.descriptionNode.attributedText?.string
  }

  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
    self.titleNode.delegate = self
    self.descriptionNode.delegate = self
  }

  func render(_ viewModel: ViewModel) {
    self.titleNode.attributedText = viewModel.title.styled(with: Typo.title)
    self.descriptionNode.attributedText = viewModel.description.styled(with: Typo.desc)
    self.setNeedsLayout()
  }

  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 24.0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [
        self.titleFieldLayoutSpec(),
        self.descriptionFieldLayoutSpec()
      ]
    )
  }

  private func titleFieldLayoutSpec() -> ASLayoutSpec {

    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 8.0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [
        self.titleIndicatorNode,
        self.titleNode
      ]
    )
  }

  private func descriptionFieldLayoutSpec() -> ASLayoutSpec {

    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 8.0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [
        self.descriptionIndicatorNode,
        self.descriptionNode
      ]
    )
  }
}

// MARK: - ASEditableTextNodeDelegate

extension EditableDetailNode: ASEditableTextNodeDelegate {

  func editableTextNodeDidUpdateText(_ editableTextNode: ASEditableTextNode) {
    self.setNeedsLayout()
  }
}
