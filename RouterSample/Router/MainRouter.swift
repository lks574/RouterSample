import Foundation
import SwiftUI

struct MainRouter: RouteableType {
  var matchPath: String { "home" }
  var matchQueryParameterKey: [String] = []
  var parentRouter: RouteableType? = .none
  let childrenRouter: [RouteableType]

  let enviroment: EnviromentType

  init(enviroment: EnviromentType) {
    self.enviroment = enviroment
    childrenRouter = [
      SettingRouter(enviroment: enviroment),
      PlaceRouter(enviroment: enviroment),
    ]
  }

  func build(match: MatchURL, navigator: LinkNavigator) -> [ViewableRouter] {
    let intent = PlaceListIntent(
      initialState: .init(),
      enviroment: enviroment,
      navigator: navigator)
    let viewController = UIHostingController(rootView: PlaceListView.build(state: intent.state, intent: intent))

    return [ .init(key: matchPath, viewController: viewController) ]
  }

  static func build(enviroment: EnviromentType) -> RouteableType {
    self.init(enviroment: enviroment)
  }
}

struct SettingRouter: RouteableType {
  var parentRouter: RouteableType?
  var childrenRouter: [RouteableType] = []
  var matchPath: String { "home/setting" }
  var matchQueryParameterKey: [String] = []

  let enviroment: EnviromentType

  func build(match: MatchURL, navigator: LinkNavigator) -> [ViewableRouter] {
    let intent = SettingIntent(
      initialState: .init(),
      enviroment: enviroment,
      navigator: navigator)
    let view = SettingView.build(state: intent.state, intent: intent)
    let viewController = UIHostingController(rootView: view)

    return [ .init(key: matchPath, viewController: viewController)]
  }

  static func build(enviroment: EnviromentType) -> RouteableType {
    self.init(enviroment: enviroment)
  }
}

struct PlaceRouter: RouteableType {
  var parentRouter: RouteableType?
  var childrenRouter: [RouteableType] = []
  var children: [RouteableType] = []
  var matchPath: String { "home/place" }
  var matchQueryParameterKey: [String] = ["placeID"]

  let enviroment: EnviromentType


  func build(match: MatchURL, navigator: LinkNavigator) -> [ViewableRouter] {
    var state: PlaceModel.State {
      guard let strPlaceID = match.query["placeID"], let placeID = Int(strPlaceID) else { return .defaultValue() }
      return .init(placeID: placeID)
    }

    let intent = PlaceIntent(initialState: state, enviroment: enviroment)
    let view = PlaceView.build(state: intent.state, intent: intent)
    let viewController = UIHostingController(rootView: view)

    return [ .init(key: matchPath, viewController: viewController) ]
  }

  static func build(enviroment: EnviromentType) -> RouteableType {
    self.init(enviroment: enviroment)
  }
}
