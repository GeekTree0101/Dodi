import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
  name: "DodiCore",
  platform: .iOS,
  dependencies: [
    .sdk(name: "Foundation.framework", status: .required),
    .cocoapods(path: "../../"),
  ]
)
