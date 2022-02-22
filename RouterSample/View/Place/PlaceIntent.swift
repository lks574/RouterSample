import Combine

protocol PlaceIntentType {
  var state: PlaceModel.State { get }
  var enviroment: EnviromentType { get }

  func send(action: PlaceModel.ViewAction)
}

final class PlaceIntent: ObservableObject {

  init(initialState: State, enviroment: EnviromentType) {
    state = initialState
    self.enviroment = enviroment
  }

  typealias State = PlaceModel.State
  typealias ViewAction = PlaceModel.ViewAction

  @Published var state: PlaceModel.State = .defaultValue()
  let enviroment: EnviromentType
  var cancellable: Set<AnyCancellable> = []
}

extension PlaceIntent: IntentType, PlaceIntentType {
  func mutate(action: PlaceModel.ViewAction, viewEffect: (() -> Void)?) {

  }
}
