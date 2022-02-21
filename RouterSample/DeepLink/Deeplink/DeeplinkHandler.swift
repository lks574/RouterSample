import Foundation

struct DeeplinkHandler {

  static func push(navigator: DeepNavi, deeplink: Deeplink) {
    deeplink.components.forEach {
      navigator.push(component: $0, animated: true)
    }
  }
}
