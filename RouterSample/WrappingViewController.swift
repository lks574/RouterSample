import SwiftUI
import UIKit

final class WrapperViewControler: UIHostingController<AnyView> {

  let key: String

  init(rootView: AnyView, key: String) {
    self.key = key
    super.init(rootView: rootView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
