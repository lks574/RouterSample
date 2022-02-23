import SwiftUI

struct NotificationView: IntentBidingType {
  @StateObject var container: Container<NotificationIntentType, NotificationModel.State>
  var intent: NotificationIntentType { container.intent }
  var state: NotificationModel.State { intent.state }
  var enviroment: EnviromentType { intent.enviroment }
}

extension NotificationView: View {
  var body: some View {
    VStack {
      Text("NotificationView")
        .padding()
    }
    .onAppear {
      print("NotificationView onAppear")
    }
    .onDisappear {
      print("NotificationView onDisappear")
    }
  }
}

extension NotificationView {
  static func build(
    state: NotificationModel.State,
    intent: NotificationIntent) -> some View
  {
    NotificationView(container: .init(
      intent: intent as NotificationIntentType,
      state: state,
      modelChangePublisher: intent.objectWillChange))
  }
}
