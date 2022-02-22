import SwiftUI

struct PlaceListView: IntentBidingType {
  @StateObject var container: Container<PlaceListIntentType, PlaceListModel.State>
  var intent: PlaceListIntentType { container.intent }
  var state: PlaceListModel.State { intent.state }
  var enviroment: EnviromentType { intent.enviroment }
  var navigator: LinkNavigator { intent.navigator }
}

extension PlaceListView: View {
  var body: some View {
    VStack {
      Text("PlaceListView")
        .padding()
      Button {
        navigator.herf(url: "menu-tr://home/place?placeID=4587")
      } label: {
        Text("Move PlaceView")
      }
      .padding()

      Button {
        navigator.herf(url: "menu-tr://home/setting")
      } label: {
        Text("Move Setting")
      }
      .padding()

    }
    .onAppear {
      print("PlaceListView onAppear")
    }
    .onDisappear {
      print("PlaceListView onDisappear")
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
