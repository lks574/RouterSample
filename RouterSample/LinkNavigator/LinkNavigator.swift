import Foundation
import UIKit
import SwiftUI

final class LinkNavigator {
  private var rootNavigationController = RootNavigationController()
  private lazy var rootNavigator: RootNavigator = {
    RootNavigator(navigationController: rootNavigationController)
  }()
  private(set) var currentHistoryStack = HistoryStack()
  let mainRouter: RouteableType

  init(enviroment: EnviromentType) {
    self.mainRouter = MainRouter.build(enviroment: Enviroment())
  }
}

extension LinkNavigator {
  func herf(url: String) {
    guard let matchURL = MatchURL.serialzied(url: url) else { return }

    let newStack = mainRouter.apply(
      historyStack: currentHistoryStack,
      match: matchURL,
      navigator: self)

    currentHistoryStack = currentHistoryStack.mutate(stack: newStack)

    rootNavigationController
      .setViewControllers(currentHistoryStack.stack.map(\.viewController), animated: true)
  }

  func replace(url: String) -> RootNavigator {
    guard let matchURL = MatchURL.serialzied(url: url) else { return rootNavigator }

    let newStack = mainRouter.apply(
      historyStack: currentHistoryStack,
      match: matchURL,
      navigator: self)

    currentHistoryStack = currentHistoryStack.mutate(stack: newStack)

    rootNavigationController
      .setViewControllers(currentHistoryStack.stack.map(\.viewController), animated: false)
    return rootNavigator
  }
}

struct RootNavigator: UIViewControllerRepresentable {

  let navigationController: UINavigationController

  func makeUIViewController(context: Context) -> some UIViewController {
    navigationController
  }

  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

  }
}
