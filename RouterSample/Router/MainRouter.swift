import Foundation
import SwiftUI

struct MainBuilder: RouteBuildeableType {
  var matchPath: String
  var build: (EnviromentType, String, MatchURL, LinkNavigator) -> ViewableRouter {{
    enviroment, matchPath, match, navigator in
    let intent = PlaceListIntent(
      initialState: .init(),
      enviroment: enviroment,
      navigator: navigator)
    let view = PlaceListView.build(state: intent.state, intent: intent)
    let viewController = WrapperViewControler(rootView: .init(view), key: matchPath)
    return .init(key: matchPath, viewController: viewController, matchURL: match)
  }}
}

struct SettingBuilder: RouteBuildeableType {
  var matchPath: String
  var build: (EnviromentType, String, MatchURL, LinkNavigator) -> ViewableRouter {
    { enviroment, matchPath, match, navigator in
      let intent = SettingIntent(
        initialState: .init(),
        enviroment: enviroment,
        navigator: navigator)
      let view = SettingView.build(state: intent.state, intent: intent)
      let viewController = WrapperViewControler(rootView: .init(view), key: matchPath)

      return .init(key: matchPath, viewController: viewController, matchURL: match)
    }
  }
}

struct NotificationBuilder: RouteBuildeableType {
  var matchPath: String
  var build: (EnviromentType, String, MatchURL, LinkNavigator) -> ViewableRouter {
    { enviroment, matchPath, match, navigator in
      let intent = NotificationIntent(initialState: .init(), enviroment: enviroment)
      let view = NotificationView.build(state: intent.state, intent: intent)
      let viewController = WrapperViewControler(rootView: .init(view), key: matchPath)

      return .init(key: matchPath, viewController: viewController, matchURL: match)
    }
  }
}

struct PlaceBuilder: RouteBuildeableType {
  var matchPath: String
  var build: (EnviromentType, String, MatchURL, LinkNavigator) -> ViewableRouter {
    { enviroment, matchPath, match, navigator in
      var state: PlaceModel.State {
        guard let strPlaceID = match.query["placeID"], let placeID = Int(strPlaceID) else { return .defaultValue() }
        return .init(placeID: placeID)
      }

      let intent = PlaceIntent(initialState: state, enviroment: enviroment)
      let view = PlaceView.build(state: intent.state, intent: intent)
      let viewController = UIHostingController(rootView: view)

      return .init(key: matchPath, viewController: viewController, matchURL: match)
    }
  }
}
