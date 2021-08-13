import UIKit

import DodiCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    registerProviderFactories()
    let rootComponent = RootComponent()
    rootComponent.repositoryBuilder.todoCachedRepository.save([
      Todo(id: 1, title: "test", description: "test"),
      Todo(id: 2, title: "test-2", description: "test"),
      Todo(id: 3, title: "test-3", description: "test"),
      Todo(id: 4, title: "test-4", description: "test")
    ])

    self.window = UIWindow(frame: UIScreen.main.bounds)
    let viewController = UIViewController()
    viewController.view.backgroundColor = .white
    self.window?.rootViewController = rootComponent.rootViewController
    self.window?.makeKeyAndVisible()
    return true
  }

}
