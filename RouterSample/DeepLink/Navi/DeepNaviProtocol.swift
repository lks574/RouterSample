//
//  DeepNaviProtocol.swift
//  RouterSample
//
//  Created by kyungseok.lee_Flitto on 2022/02/17.
//

import Foundation
import UIKit

protocol DeepNaviProtocol: AnyObject {
  var navigation: UINavigationController { get }

  func register(pattern: String, factory: @escaping ViewControllerBuilder)
  func viewController(component: DeeplinkComponent) -> UIViewController?
  func push(component: DeeplinkComponent, animated: Bool)
  func back(animated: Bool)
}
