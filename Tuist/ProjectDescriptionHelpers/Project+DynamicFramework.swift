import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {

  public static func dynamicFramework(
    name: String,
    platform: Platform,
    dependencies: [TargetDependency]
  ) -> Project {

    return Project(
      name: name,
      targets: [
        Target(
          name: name,
          platform: platform,
          product: .framework,
          bundleId: "com.dodi.\(name)",
          infoPlist: .default,
          sources: ["Sources/**"],
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
      ],
      schemes: [
        Scheme(
          name: name,
          shared: true,
          buildAction: BuildAction(
            targets: [
              TargetReference(projectPath: nil, target: name)
            ]
          ),
          testAction: TestAction(
            targets: [
              TestableTarget(
                target: TargetReference(
                  projectPath: nil,
                  target: "\(name)Tests"
                )
              )
            ],
            arguments: Arguments(
              environment: [
                "OS_ACTIVITY_MODE": "disable"
              ]
            )
          )
        )
      ]
    )
  }

}
