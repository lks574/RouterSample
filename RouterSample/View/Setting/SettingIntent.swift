//
//  SettingIntent.swift
//  RouterSample
//
//  Created by kyungseok.lee_Flitto on 2022/02/07.
//

import Combine

protocol SettingIntentType {
  var state: SettingModel.State { get }
  var enviroment: Enviroment { get }

  func send(action: SettingModel.ViewAction)
}

final class SettingIntent: ObservableObject {

  init(initialState: State, enviroment: Enviroment) {
    state = initialState
    self.enviroment = enviroment
  }

  typealias State = SettingModel.State
  typealias ViewAction = SettingModel.ViewAction

  @Published var state: SettingModel.State = .init()
  let enviroment: Enviroment
  var cancellable: Set<AnyCancellable> = []
}

extension SettingIntent: IntentType, SettingIntentType {
  func mutate(action: SettingModel.ViewAction, viewEffect: (() -> Void)?) {

  }
}
