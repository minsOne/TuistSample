import ProjectDescription
import ProjectDescriptionHelpers

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "StaticFrameworkKit",
  organizationName: "minsone",
  packages: [
    .alamofire,
    .kingfisher
  ],
  targets: [
    Target(name: "StaticFrameworkKit",
           platform: .iOS,
           product: .staticFramework,
           bundleId: "kr.minsone.StaticFrameworkKit",
           deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad]),
           infoPlist: .default,
           sources: .sources,
           actions: [],
           dependencies: [
            .alamofire,
            .kingfisher,
            .staticFrameworkKit2
           ]),
    Target(name: "StaticFrameworkKitTests",
           platform: .iOS,
           product: .unitTests,
           bundleId: "kr.minsone.StaticFrameworkKitTests",
           infoPlist: .default,
           sources: .tests,
           dependencies: [
            .target(name: "StaticFrameworkKit")
           ])
  ]
)
