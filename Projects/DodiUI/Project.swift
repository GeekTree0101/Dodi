import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
  name: "DodiUI",
  platform: .iOS,
  dependencies: [
    .sdk(name: "Foundation.framework", status: .required),
    .sdk(name: "UIKit.framework", status: .required),
    .cocoapods(path: "../../"),
  ]
)
