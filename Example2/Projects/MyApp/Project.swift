import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "MyApp", platform: .iOS, dependencies: [
    .project(target: "MyAppKit", path: .relativeToManifest("../MyAppKit"))
])
