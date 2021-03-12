//
//  TargetDependencyExtension.swift
//  ProjectDescriptionHelpers
//
//  Created by minsone on 2021/03/12.
//

import ProjectDescription

// MARK: Project
public extension TargetDependency {
  static let staticFrameworkKit: TargetDependency = .project(target: "StaticFrameworkKit",
                                                             path: .relativeToRoot("Projects/StaticFrameworkKit"))
  static let staticFrameworkKit2: TargetDependency = .project(target: "StaticFrameworkKit2",
                                                              path: .relativeToRoot("Projects/StaticFrameworkKit2"))
}

// MARK: Package
public extension TargetDependency {
  static let alamofire: TargetDependency = .package(product: "Alamofire")
  static let kingfisher: TargetDependency = .package(product: "Kingfisher")
}

public extension Package {
  static let alamofire: Package = .package(url: "https://github.com/Alamofire/Alamofire.git", .branch("master"))
  static let kingfisher: Package = .package(url: "https://github.com/onevcat/Kingfisher", from: "5.1.0")
}

// MARK: SourceFile
public extension SourceFilesList {
  static let sources: SourceFilesList = "Sources/**"
  static let tests: SourceFilesList = "Tests/**"
}

// MARK: Resource
public enum ResourceType: String {
  case xibs        = "Sources/*.xib"
  case storyboards = "Resources/*.storyboard"
}

// MARK: Extension
public extension Array where Element == FileElement {
  static func resources(with resources: [ResourceType]) -> [FileElement] {
    resources.map { FileElement(stringLiteral: $0.rawValue) }
  }
}
