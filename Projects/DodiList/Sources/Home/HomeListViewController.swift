//
//  HomeListViewController.swift
//  DodiList
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import DeepDiff

import DodiUI
import DodiDetail

public final class HomeListViewController: BaseViewController {

  public  struct Dependency {

    let homeBloc: HomeListBloc
    let detailBuilder: DetailBuilder
  }

  // MARK: - UI

  private let collectionNode = ASCollectionNode(
    collectionViewLayout: UICollectionViewFlowLayout().then {
      $0.minimumLineSpacing = 0.0
      $0.minimumInteritemSpacing = 0.0
      $0.scrollDirection = .vertical
    }
  ).then {
    $0.alwaysBounceVertical = true
  }

  private let refreshControl = UIRefreshControl()

  // MARK: - Prop

  private let action: HomeListAction
  private let detailBuilder: DetailBuilder
  private var items: [CardCellNode.ViewModel] = []

  public init(dependeny: Dependency) {
    self.action = dependeny.homeBloc
    self.detailBuilder = dependeny.detailBuilder
    super.init()
    self.title = "Home"
    dependeny.homeBloc.addRender(render: self)
  }

  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.collectionNode.delegate = self
    self.collectionNode.dataSource = self
    self.collectionNode.view.refreshControl = self.refreshControl.then {
      $0.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    self.action.reload()
  }

  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: self.node.safeAreaInsets,
      child: self.collectionNode
    )
  }

  @objc private func didPullToRefresh() {
    self.refreshControl.beginRefreshing()
    self.action.reload()
  }
}

// MARK: - ASCollectionDelegate

extension HomeListViewController: ASCollectionDelegate {

  public func collectionNode(_ collectionNode: ASCollectionNode,
                      didSelectItemAt indexPath: IndexPath) {

    let detailViewController = self.detailBuilder.editableDetailViewController.then {
      $0.router?.dataStore?.todoID = self.items[indexPath.item].id
    }

    detailViewController.await { result in
      guard case let .saved(todo) = result else { return }
      self.action.update(todo)
    }

    self.present(
      UINavigationController(
        rootViewController: detailViewController
      ),
      animated: true,
      completion: nil
    )
  }

  public func collectionNode(_ collectionNode: ASCollectionNode,
                             constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
    return ASSizeRange(
      min: CGSize(width: collectionNode.bounds.width, height: 0.0),
      max: CGSize(width: collectionNode.bounds.width, height: .infinity)
    )
  }

}

// MARK: - ASCollectionDataSource

extension HomeListViewController: ASCollectionDataSource {

  public func collectionNode(_ collectionNode: ASCollectionNode,
                      numberOfItemsInSection section: Int) -> Int {
    return self.items.count
  }

  public func collectionNode(_ collectionNode: ASCollectionNode,
                      nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    let item = self.items[indexPath.item]
    return {
      CardCellNode(
        item,
        style: CardCellNode.CardStyle(
          margin: UIEdgeInsets(
            top: 12.0,
            left: 12.0,
            bottom: 12.0,
            right: 12.0
          ),
          padding: UIEdgeInsets(
            top: 16.0,
            left: 16.0,
            bottom: 16.0,
            right: 16.0
          )
        )
      )
    }
  }
}

// MARK: - render

extension HomeListViewController: HomeListRender {

  func reload(_ items: [CardCellNode.ViewModel]) {
    self.refreshControl.endRefreshing()
    self.items = items
    self.collectionNode.reloadData()
  }

  func update(_ updatedItems: [CardCellNode.ViewModel]) {

    let changes = diff(old: self.items, new: updatedItems)
    self.items = updatedItems
    self.collectionNode.reload(
      changes: changes,
      section: 0,
      animated: true,
      completion: nil
    )
  }

}
