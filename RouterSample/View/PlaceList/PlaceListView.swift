import SwiftUI

struct PlaceListView: IntentBidingType {
  @StateObject var container: Container<PlaceListIntentType, PlaceListModel.State>
  var intent: PlaceListIntentType { container.intent }
  var state: PlaceListModel.State { intent.state }
  var enviroment: Enviroment { intent.enviroment }
}

extension PlaceListView: View {
  var body: some View {
    VStack {
      Text("PlaceListView")
        .padding()
      Button {
        enviroment.navigator.push(
          component: .init(
            name: Page.place.rawValue,
            arguments: ["id": .value("3")]),
          animated: true)
      } label: {
        Text("Move PlaceView")
      }
      .padding()

      Button {
        enviroment.navigator.push(
          component: DeeplinkComponent.init(
            name: Page.setting.rawValue),
          animated: true)
      } label: {
        Text("Move Setting")
      }
      .padding()

    }
  }
}

extension PlaceListView {
  static func build(
    state: PlaceListModel.State,
    intent: PlaceListIntent) -> some View
  {
    PlaceListView(container: .init(
      intent: intent as PlaceListIntentType,
      state: state,
      modelChangePublisher: intent.objectWillChange))
  }
}
