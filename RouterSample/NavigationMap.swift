//import Foundation
//
//enum Page: String {
//  case root = "root"
//  case setting = "setting"
//  case place = "place"
//  case placeList = "placeList"
//}
//
//struct NavigationMap {
//
//  static func initialize(navigator: DeepNaviProtocol) {
//
//    let enviroment = Enviroment(navi: navigator)
//
//    navigator.register(pattern: Page.setting.rawValue) { deepLink in
//      return SettingViewController(enviroment: enviroment)
//    }
//
//    navigator.register(pattern: Page.place.rawValue) { deepLink in
//      guard
//        case let .value(id) = deepLink.arguments?["id"],
//        let intID = Int(id)
//      else { return nil }
//      return PlaceViewController(enviroment: enviroment, placeID: intID)
//    }
//
//    navigator.register(pattern: Page.root.rawValue) { deepLink in
//      return PlaceListViewController(enviroment: enviroment)
//    }
//    
//  }
//}
