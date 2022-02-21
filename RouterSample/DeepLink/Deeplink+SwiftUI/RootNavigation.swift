import Foundation
import UIKit
import SwiftUI

struct RootNavigation: UIViewControllerRepresentable {

  init(navigation: UINavigationController) {
    self.navigation = navigation
  }

  let navigation: UINavigationController

  func makeUIViewController(context: Context) -> UINavigationController {
    navigation
  }

  func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
  }
}

