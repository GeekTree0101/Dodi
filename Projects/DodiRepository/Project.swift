import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
  name: "DodiRepository",
  platform: .iOS,
  dependencies: [
    .sdk(name: "Foundation.framework", status: .required),
    .project(target: "DodiCore", path: "../DodiCore"),
    .cocoapods(path: "../../"),
  ]
)
