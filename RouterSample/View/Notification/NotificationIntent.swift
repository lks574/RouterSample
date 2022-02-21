import Combine

protocol NotificationIntentType {
  var state: NotificationModel.State { get }
  var enviroment: Enviroment { get }

  func send(action: NotificationModel.ViewAction)
}

final class NotificationIntent: ObservableObject {

  init(initialState: State, enviroment: Enviroment) {
    state = initialState
    self.enviroment = enviroment
  }

  typealias State = NotificationModel.State
  typealias ViewAction = NotificationModel.ViewAction

  @Published var state: NotificationModel.State = .init()
  let enviroment: Enviroment
  var cancellable: Set<AnyCancellable> = []
}

extension NotificationIntent: IntentType, NotificationIntentType {
  func mutate(action: NotificationModel.ViewAction, viewEffect: (() -> Void)?) {

  }
}
