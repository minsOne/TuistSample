import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "StaticFrameworkKit2",
  organizationName: "minsone",
  packages: [
    .alamofire,
    .kingfisher
  ],
  targets: [
    Target(name: "StaticFrameworkKit2",
           platform: .iOS,
           product: .staticFramework,
           bundleId: "kr.minsone.StaticFrameworkKit2",
           deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad]),
           infoPlist: .default,
           sources: .sources,
           actions: [],
           dependencies: []),
    Target(name: "StaticFrameworkKit2Tests",
           platform: .iOS,
           product: .unitTests,
           bundleId: "kr.minsone.StaticFrameworkKit2Tests",
           infoPlist: .default,
           sources: .tests,
           dependencies: [
            .target(name: "StaticFrameworkKit2")
           ])
  ]
)
