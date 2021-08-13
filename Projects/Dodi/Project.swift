import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.excutable(
  name: "Dodi",
  platform: .iOS,
  dependencies: [
    .sdk(name: "Foundation.framework", status: .required),
    .sdk(name: "UIKit.framework", status: .required),
    .project(target: "DodiUI", path: "../DodiUI"),
    .project(target: "DodiList", path: "../DodiList"),
    .project(target: "DodiDetail", path: "../DodiDetail"),
    .cocoapods(path: "../..")
  ]
)
