//
//  CardNode.swift
//  DodiUI
//
//  Created by Geektree0101 on 2021/08/12.
//

import AsyncDisplayKit
import BonMot
import DeepDiff
import Then

public final class CardCellNode: ASCellNode {

  public struct ViewModel: DiffAware {

    public typealias DiffId = Int

    public var diffId: DiffId {
      return self.id
    }

    public let id: Int
    public let title: String
    public let description: String

    public init(id: Int, title: String, description: String) {
      self.id = id
      self.title = title
      self.description = description
    }

    public static func compareContent(_ a: CardCellNode.ViewModel,
                               _ b: CardCellNode.ViewModel) -> Bool {
      return a.title == b.title
        && a.description == b.description
    }
  }

  public struct CardStyle {

    public let margin: UIEdgeInsets
    public let padding: UIEdgeInsets

    public init(margin: UIEdgeInsets, padding: UIEdgeInsets) {
      self.margin = margin
      self.padding = padding
    }
  }

  private enum Typo {

    static let title = StringStyle(
      .font(UIFont.boldSystemFont(ofSize: 24.0)),
      .color(UIColor.black)
    )

    static let desc = StringStyle(
      .font(UIFont.systemFont(ofSize: 16.0)),
      .color(UIColor.darkGray)
    )
  }

  private let titleNode = ASTextNode()
  private let descriptionNode = ASTextNode()
  private let backgroundNode = ASDisplayNode().then {
    $0.backgroundColor = UIColor.white
    $0.shadowColor = UIColor.black.cgColor
    $0.shadowOffset = CGSize(width: 0.0, height: 2.0)
    $0.shadowRadius = 4.0
    $0.shadowOpacity = 0.5
  }

  private let cardStyle: CardStyle

  public init(_ viewModel: ViewModel, style cardStyle: CardStyle) {
    self.cardStyle = cardStyle
    super.init()
    self.automaticallyManagesSubnodes = true
    self.render(viewModel)
  }

  public override func layout() {
    super.layout()
    self.backgroundNode.cornerRadius = 8.0
  }

  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: self.cardStyle.margin,
      child: ASBackgroundLayoutSpec(
        child: ASInsetLayoutSpec(
          insets: self.cardStyle.padding,
          child: ASStackLayoutSpec(
            direction: .vertical,
            spacing: 8.0,
            justifyContent: .start,
            alignItems: .start,
            children: [
              self.titleNode.styled {
                $0.flexShrink = 1.0
              },
              self.descriptionNode.styled {
                $0.flexShrink = 1.0
              }
            ]
          ).styled {
            $0.minHeight = ASDimensionMake(120.0)
          }
        ),
        background: self.backgroundNode
      )
    )
  }

  public func render(_ viewModel: ViewModel) {
    self.titleNode.attributedText = viewModel.title
      .styled(with: Typo.title)
    self.descriptionNode.attributedText = viewModel.description
      .styled(with: Typo.desc)
    self.updateAccessibility()
  }

  private func updateAccessibility() {

    self.accessibilityElements = [
      self.titleNode,
      self.descriptionNode
    ]
  }
}
