import Combine

protocol PlaceListIntentType {
  var state: PlaceListModel.State { get }
  var enviroment: EnviromentType { get }
  var navigator: LinkNavigator { get }

  func send(action: PlaceListModel.ViewAction)
}

final class PlaceListIntent: ObservableObject {

  init(initialState: State, enviroment: EnviromentType, navigator: LinkNavigator) {
    state = initialState
    self.enviroment = enviroment
    self.navigator = navigator
  }

  typealias State = PlaceListModel.State
  typealias ViewAction = PlaceListModel.ViewAction

  @Published var state: PlaceListModel.State = .init()
  let enviroment: EnviromentType
  let navigator: LinkNavigator
  var cancellable: Set<AnyCancellable> = []
}

extension PlaceListIntent: IntentType, PlaceListIntentType {
  func mutate(action: PlaceListModel.ViewAction, viewEffect: (() -> Void)?) {
  }
}
