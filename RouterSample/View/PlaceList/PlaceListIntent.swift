import Combine

protocol PlaceListIntentType {
  var state: PlaceListModel.State { get }
  var enviroment: Enviroment { get }

  func send(action: PlaceListModel.ViewAction)
}

final class PlaceListIntent: ObservableObject {

  init(initialState: State, enviroment: Enviroment) {
    state = initialState
    self.enviroment = enviroment
  }

  typealias State = PlaceListModel.State
  typealias ViewAction = PlaceListModel.ViewAction

  @Published var state: PlaceListModel.State = .init()
  let enviroment: Enviroment
  var cancellable: Set<AnyCancellable> = []
}

extension PlaceListIntent: IntentType, PlaceListIntentType {
  func mutate(action: PlaceListModel.ViewAction, viewEffect: (() -> Void)?) {

  }
}
