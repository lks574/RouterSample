import Foundation
import UIKit
import SwiftUI

typealias ViewControllerBuilder = (_ deepLink: DeeplinkComponent) -> UIViewController?

class DeepNavi: DeepNaviProtocol {
  private var viewControllerFactories = [String: ViewControllerBuilder]()
  
  var navigation: UINavigationController = .init()

  init() {

  }

  func register(pattern: String, factory: @escaping ViewControllerBuilder) {
    self.viewControllerFactories[pattern] = factory
  }

  func viewController(component: DeeplinkComponent) -> UIViewController? {
    guard let factory = viewControllerFactories[component.name] else { return nil }
    return factory(component)
  }

  func push(component: DeeplinkComponent, animated: Bool) {
    guard let viewController = viewController(component: component) else { return }
    push(viewController: viewController, animated: animated)
  }

  func back(animated: Bool) {
    navigation.popViewController(animated: true)
  }

  private func push(viewController: UIViewController, animated: Bool = true) {
    navigation.pushViewController(viewController, animated: animated)
  }

}

extension DeepNavi {
  func start() -> AnyView {
    guard let root = self.viewController(component: .init(name: "root")) else { return AnyView(EmptyView()) }
    self.navigation.setViewControllers([root], animated: false)
    return AnyView(RootNavigation(navigation: self.navigation))
  }
}
