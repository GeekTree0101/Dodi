import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {

  public static func excutable(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency]
  ) -> Project {

    return Project(
      name: name,
      organizationName: "com.dodi",
      targets: [
        Target(
          name: name,
          platform: platform,
          product: .app,
          bundleId: "com.dodi.\(name)",
          infoPlist: .extendingDefault(
            with: [
              "CFBundleShortVersionString": "1.0",
              "CFBundleVersion": "1",
              "UIMainStoryboardFile": "",
              "UILaunchStoryboardName": "LaunchScreen"
            ]
          ),
          sources: ["Sources/**"],
          resources: ["Resources/**"],
          dependencies: dependencies
        ),
        Target(
          name: "\(name)Tests",
          platform: platform,
          product: .unitTests,
          bundleId: "com.dodi.\(name)Tests",
          infoPlist: .default,
          sources: ["Tests/**"],
          dependencies: [
            .target(name: "\(name)")
          ]
        )
      ]
    )
  }
}
