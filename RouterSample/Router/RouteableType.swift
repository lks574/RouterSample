import Foundation
import UIKit
import SwiftUI

struct MatchURL {
  var pathes: [String]
  var query: [String: String]

  static func defaultValue() -> Self {
    self.init(pathes: [], query: [:])
  }

  static func serialzied(url: String) -> Self? {
    guard let components = URLComponents(string: url) else { return .none }

    var compositePaths: [String] {
      let paths = components.path.split(separator: "/").map(String.init)
      guard let host = components.host else {
        return paths
      }
      return [host] + paths
    }

    return .init(
      pathes: getPath(compositePaths),
      query: getQuery(components.queryItems))
  }

  static func getPath(_ path: [String]) -> [String] {
    guard let lastPath = path.last, lastPath.hasPrefix(":") else { return path }
    return path.dropLast()
  }

  static func getFlagment(_ path: [String]) -> String? {
    guard let lastPath = path.last, lastPath.hasPrefix(":") else { return .none }
    return lastPath
  }

  static func getQuery(_ quertItems: [URLQueryItem]?) -> [String: String] {
    guard let quertItems = quertItems else { return [:] }
    return quertItems.reduce([String: String](), { curr, next in
      curr.merging([next.name: next.value ?? ""]) { $1 }
    })
  }
}

protocol RouteBuildeableType {
  var matchPath: String { get }
  var build: (EnviromentType, String, MatchURL, LinkNavigator) -> ViewableRouter { get }
}

struct ViewableRouter {
  var key: String
  var viewController: UIViewController
  var matchURL: MatchURL

  static func emptyView() -> ViewableRouter {
    .init(key: "empty", viewController: UIViewController(), matchURL: .defaultValue())
  }
}

protocol RouterBuildGroupType {
  var builders: [RouteBuildeableType] { get }
  func build(history: HistoryStack, match: MatchURL, enviroment: EnviromentType,  navigator: LinkNavigator) -> [ViewableRouter]
}
