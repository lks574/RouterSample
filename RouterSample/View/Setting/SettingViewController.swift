//
//  SettingViewController.swift
//  RouterSample
//
//  Created by kyungseok.lee_Flitto on 2022/02/07.
//

import Foundation
import UIKit
import SwiftUI

class SettingViewController: UIHostingController<SettingView> {
  init(enviroment: Enviroment) {
    let intent = SettingIntent(initialState: .init(), enviroment: enviroment)
    let view = SettingView.build(state: .init(), intent: intent)
    super.init(rootView: view as! SettingView)
  }

  @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
