import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "StaticFrameworkKit", // 프로젝트 이름
    organizationName: "minsone", // organization 이름
    packages: [
        // 프로젝트에 추가하는 Swift Package
        .package(url: "https://github.com/Alamofire/Alamofire.git", .branch("master"))
    ],
    settings: Settings(configurations: [
        // 프로젝트의 Configuration, .relativeToRoot는 Tuist 폴더 또는 .git 이 있는 경로 중 가장 가까운 경로를 사용함. 필요에 따라 .relativeToManifest, .relativeToCurrentFile를 사용함.
        .debug(name: "DEV", xcconfig: .relativeToRoot("Configurations/StaticFrameworkKit-DEV.xcconfig")),
        .debug(name: "TEST", xcconfig: .relativeToRoot("Configurations/StaticFrameworkKit-TEST.xcconfig")),
        .debug(name: "STAGE", xcconfig: .relativeToRoot("Configurations/StaticFrameworkKit-STAGE.xcconfig")),
        .release(name: "PROD", xcconfig: .relativeToRoot("Configurations/StaticFrameworkKit-PROD.xcconfig"))
    ]),
    targets: [
        // 프로젝트의 타겟
        Target(name: "StaticFrameworkKit", // 타겟 이름
               platform: .iOS, // 플랫폼
               product: .staticFramework, // Static Framework, Dynamic Framework, Static Library, App 등을 설정
               bundleId: "kr.minsone.StaticFrameworkKit", // BundleId
               deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad]), // 배포타겟 정보
               infoPlist: .default, // default는 plist를 생성해서 사용, plist를 경로를 적용하여 임의의 plist를 사용 가능
               sources: ["Sources/**"], // 소스 경로
               resources: [], // 리소스 경로
               actions: [], // 빌드시 실행할 Action
               dependencies: [
                // 타겟의 의존성 설정, Cocoapods, Carthage, XCFramework, Swift Package 등을 지정.
                .package(product: "Alamofire")
               ]),
        Target(name: "StaticFrameworkKitTests",
               platform: .iOS,
               product: .unitTests,
               bundleId: "kr.minsone.StaticFrameworkKitTests",
               infoPlist: .default,
               sources: ["Tests/**"],
               dependencies: [
                // 유닛 테스트의 의존성은 Framework, Library 또는 App으로 설정해야 함.
                .target(name: "StaticFrameworkKit")
               ]),
    ],
    // 타겟에 해당하는 스킴(StaticFrameworkKit, StaticFrameworkKitTests) 외 추가 스킴을 생성, 관리
    schemes: [
        Scheme(name: "StaticFrameworkKit-DEV", // 스킴 이름
               shared: true, // shared 체크여부
               buildAction: BuildAction(targets: ["StaticFrameworkKit"]), // Build시 타겟 설정
               testAction: TestAction(targets: ["StaticFrameworkKitTests"], // Test시 타겟, configuration, test converage 설정
                                      configurationName: "DEV",
                                      coverage: true),
               runAction: RunAction(configurationName: "DEV"), // run시 configuration 설정
               archiveAction: ArchiveAction(configurationName: "DEV"), // archive시 configuration 설정
               profileAction: ProfileAction(configurationName: "DEV"), // profile시 configuration 설정
               analyzeAction: AnalyzeAction(configurationName: "DEV") // analyze시 configuration 설정
        ),
        Scheme(name: "StaticFrameworkKit-TEST",
               shared: true,
               buildAction: BuildAction(targets: ["StaticFrameworkKit"]),
               testAction: TestAction(targets: ["StaticFrameworkKitTests"],
                                      configurationName: "TEST",
                                      coverage: true),
               runAction: RunAction(configurationName: "TEST"),
               archiveAction: ArchiveAction(configurationName: "TEST"),
               profileAction: ProfileAction(configurationName: "TEST"),
               analyzeAction: AnalyzeAction(configurationName: "TEST")
        ),
        Scheme(name: "StaticFrameworkKit-STAGE",
               shared: true,
               buildAction: BuildAction(targets: ["StaticFrameworkKit"]),
               testAction: TestAction(targets: ["StaticFrameworkKitTests"],
                                      configurationName: "STAGE",
                                      coverage: true),
               runAction: RunAction(configurationName: "STAGE"),
               archiveAction: ArchiveAction(configurationName: "STAGE"),
               profileAction: ProfileAction(configurationName: "STAGE"),
               analyzeAction: AnalyzeAction(configurationName: "STAGE")
        ),
        Scheme(name: "StaticFrameworkKit-PROD",
               shared: true,
               buildAction: BuildAction(targets: ["StaticFrameworkKit"]),
               testAction: TestAction(targets: ["StaticFrameworkKitTests"],
                                      configurationName: "PROD",
                                      coverage: true),
               runAction: RunAction(configurationName: "PROD"),
               archiveAction: ArchiveAction(configurationName: "PROD"),
               profileAction: ProfileAction(configurationName: "PROD"),
               analyzeAction: AnalyzeAction(configurationName: "PROD")
        )
    ],
    additionalFiles: []
)
