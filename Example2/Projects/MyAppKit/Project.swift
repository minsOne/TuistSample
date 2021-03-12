import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: "MyAppKit", platform: .iOS, dependencies: [
    .project(target: "MyAppSupport", path: .relativeToManifest("../MyAppSupport"))
])
