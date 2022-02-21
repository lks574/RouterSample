//
//  PlaceListViewController.swift
//  RouterSample
//
//  Created by kyungseok.lee_Flitto on 2022/02/07.
//

import Foundation
import UIKit
import SwiftUI

class PlaceListViewController: UIHostingController<PlaceListView> {
  init(enviroment: Enviroment) {
    let intent = PlaceListIntent(initialState: .init(), enviroment: enviroment)
    let view = PlaceListView.build(state: .init(), intent: intent)
    super.init(rootView: view as! PlaceListView)
  }

  @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
