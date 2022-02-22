import Foundation
import UIKit

struct HistoryStack {

  let stack: [ViewableRouter]

  func mutate(stack: [ViewableRouter]) -> Self {
    .init(stack: stack)
  }
}

extension HistoryStack {
  init() {
    self.init(stack: [])
  }
}
