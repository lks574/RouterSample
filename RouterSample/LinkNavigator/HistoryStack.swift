import Foundation
import UIKit

struct HistoryStack {

  let stack: [ViewableRouter]

  func mutate(stack: [ViewableRouter]) -> Self {
    .init(stack: stack)
  }

  func reorderStack(viewControllers: [WrapperViewControler]) -> Self {
    let newStack = stack.filter { router in
      viewControllers.first(where: { $0.key ==  router.key }) != nil
    }
    return .init(stack: newStack)
  }
}

extension HistoryStack {
  init() {
    self.init(stack: [])
  }
}
