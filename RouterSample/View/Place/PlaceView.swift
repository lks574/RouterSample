import SwiftUI

struct PlaceView: IntentBidingType {
  @StateObject var container: Container<PlaceIntentType, PlaceModel.State>
  var intent: PlaceIntentType { container.intent }
  var state: PlaceModel.State { intent.state }
  var enviroment: EnviromentType { intent.enviroment }
}

extension PlaceView: View {
  var body: some View {
    VStack {
      Text("PlaceView")
        .padding()
      Text("PlaceID: \(state.placeID)")
    }
    .onAppear {
      print("PlaceView onAppear")
    }
    .onDisappear {
      print("PlaceView onDisappear")
    }
  }
}

extension PlaceView {
  static func build(
    state: PlaceModel.State,
    intent: PlaceIntent) -> some View
  {
    PlaceView(container: .init(
      intent: intent as PlaceIntentType,
      state: state,
      modelChangePublisher: intent.objectWillChange))
  }
}
