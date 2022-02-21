//
//  PlaceViewController.swift
//  RouterSample
//
//  Created by kyungseok.lee_Flitto on 2022/02/07.
//

import Foundation
import UIKit
import SwiftUI

class PlaceViewController: UIHostingController<PlaceView> {
  init(enviroment: Enviroment, placeID: Int) {
    let intent = PlaceIntent(initialState: .init(), enviroment: enviroment)
    let view = PlaceView.build(state: .init(), intent: intent)
    super.init(rootView: view as! PlaceView)
  }

  @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
