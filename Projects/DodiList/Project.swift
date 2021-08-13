import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
  name: "DodiList",
  platform: .iOS,
  dependencies: [
    .sdk(name: "Foundation.framework", status: .required),
    .project(target: "DodiRepository", path: "../DodiRepository"),
    .project(target: "DodiCore", path: "../DodiCore"),
    .project(target: "DodiUI", path: "../DodiUI"),
    .cocoapods(path: "../../"),
  ]
)
