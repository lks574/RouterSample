import Combine

protocol NotificationIntentType {
  var state: NotificationModel.State { get }
  var enviroment: EnviromentType { get }

  func send(action: NotificationModel.ViewAction)
}

final class NotificationIntent: ObservableObject {

  init(initialState: State, enviroment: EnviromentType) {
    state = initialState
    self.enviroment = enviroment
  }

  typealias State = NotificationModel.State
  typealias ViewAction = NotificationModel.ViewAction

  @Published var state: NotificationModel.State = .init()
  let enviroment: EnviromentType
  var cancellable: Set<AnyCancellable> = []
}

extension NotificationIntent: IntentType, NotificationIntentType {
  func mutate(action: NotificationModel.ViewAction, viewEffect: (() -> Void)?) {

  }
}
