//
//  EditableDetailViewController.swift
//  DodiDetail
//
//  Created by Geektree0101 on 2021/08/13.
//

import Foundation

import DodiUI
import DodiRepository
import DodiCore

public enum EditableDetailResult {

  case saved(todo: Todo)
}

protocol EditableDetailDisplayLogic: AnyObject {

  func load(_ viewModel: EditableDetailModel.Load.ViewModel)
}

public final class EditableDetailViewController: BaseViewController {

  public struct Dependency {

    let todoCachedRepository: TodoCachedRepository
  }

  // MARK: - UI
  private let closeButtonItem = UIBarButtonItem(systemItem: .close)
  private let saveButtonItem = UIBarButtonItem(systemItem: .save)

  private let scrollNode = ASScrollNode().then {
    $0.automaticallyManagesSubnodes = true
    $0.automaticallyManagesContentSize = true
    $0.scrollableDirections = [.up, .down]
  }

  private let contentNode = EditableDetailNode()

  // MARK: - Prop
  public var router: (EditableDetailRouterLogic & EditableDetailDataPassing)!
  private var interactor: EditableDetailInteractorLogic!
  var awaitHandler: ((EditableDetailResult) -> Void)?

  public init(dependency: Dependency) {
    super.init()
    self.configure(dependency: dependency)
    self.title = "Editor"
  }

  private func configure(dependency: Dependency) {
    let viewController = self
    let router = EditableDetailRouter()
    let presenter = EditableDetailPresenter()
    let interactor = EditableDetailInteractor(
      dependency: EditableDetailInteractor.Dependency(
        todoCachedRepository: dependency.todoCachedRepository,
        presenter: presenter
      )
    )

    presenter.viewController = viewController

    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func await(_ awaitHandler: @escaping (EditableDetailResult) -> Void) {
    self.awaitHandler = awaitHandler
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.scrollNode.layoutSpecBlock = { [weak self] (_, _) -> ASLayoutSpec in
      return self?.scrollLayoutSpec() ?? ASLayoutSpec()
    }
    self.navigationItem.leftBarButtonItem = self.closeButtonItem.then {
      $0.target = self
      $0.action = #selector(close)
    }
    self.navigationItem.rightBarButtonItem = self.saveButtonItem.then {
      $0.target = self
      $0.action = #selector(didTapSave)
    }

    self.interactor.load(
      EditableDetailModel.Load.Request()
    )
  }

  public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: self.node.safeAreaInsets,
      child: self.scrollNode
    )
  }

  private func scrollLayoutSpec() -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 56.0, left: 16.0, right: 16.0),
      child: self.contentNode
    )
  }

  @objc private func didTapSave() {

    self.interactor.save(
      EditableDetailModel.Save.Request(
        title: self.contentNode.currentTitle ?? "",
        description: self.contentNode.currentDescription ?? ""
      )
    )

    self.router.saved()
  }

  @objc private func close() {

    self.dismiss(animated: true, completion: nil)
  }
}

// MARK: - EditableDetailDisplayLogic

extension EditableDetailViewController: EditableDetailDisplayLogic {

  func load(_ viewModel: EditableDetailModel.Load.ViewModel) {

    self.contentNode.render(viewModel.contentViewModel)
  }
}
