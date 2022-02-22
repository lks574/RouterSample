import Foundation
import UIKit
import SwiftUI

struct MatchURL {
  var path: [String]
  var flagment: String?
  var query: [String: String]

  static func serialzied(url: String) -> MatchURL? {
    guard let components = URLComponents(string: url) else { return .none }

    var compositePaths: [String] {
      let paths = components.path.split(separator: "/").map(String.init)
      guard let host = components.host else {
        return paths
      }
      return [host] + paths
    }

    return .init(
      path: getPath(compositePaths),
      flagment: getFlagment(compositePaths),
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

protocol RouteableType {
  var parentRouter: RouteableType? { get }
  var childrenRouter: [RouteableType] { get }
  var matchPath: String { get }
  func apply(historyStack: HistoryStack, match: MatchURL, navigator: LinkNavigator) -> [ViewableRouter]
  func build(match: MatchURL, navigator: LinkNavigator) -> [ViewableRouter]

  static func build(enviroment: EnviromentType) -> RouteableType
}

extension RouteableType {
  func apply(historyStack: HistoryStack, match: MatchURL, navigator: LinkNavigator) -> [ViewableRouter] {
    var matchingViews: [ViewableRouter] {
      guard let findView = historyStack.stack.first(where: { $0.key == matchPath })
      else { return build(match: match, navigator: navigator) }
      return [findView]
    }
    let joinedPath = match.path.joined(separator: "/")
    guard let subRouter = childrenRouter.first(where: { joinedPath.contains($0.matchPath) }) else {
      return matchingViews
    }

    return matchingViews + subRouter.build(match: match, navigator: navigator)
  }
}

struct ViewableRouter {
  var key: String
  var viewController: UIViewController

  static func emptyView() -> ViewableRouter {
    .init(key: "empty", viewController: UIViewController())
  }
}
