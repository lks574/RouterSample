import SwiftUI

struct SettingView: IntentBidingType {
  @StateObject var container: Container<SettingIntentType, SettingModel.State>
  var intent: SettingIntentType { container.intent }
  var state: SettingModel.State { intent.state }
  var enviroment: EnviromentType { intent.enviroment }
  var navigator: LinkNavigator { intent.navigator }
}

extension SettingView: View {
  var body: some View {
    VStack {
      Text("SettingView")
        .padding()
      Button(action: {
        navigator.back()
      }) {
        Text("Back")
      }
      Button(action: {
        navigator.href(url: "/notification")
      }) {
        Text("Move Notification")
      }

    }
    .onAppear {
      print("SettingView onAppear")
    }
    .onDisappear {
      print("SettingView onDisappear")
    }
  }
}

extension SettingView {
  static func build(
    state: SettingModel.State,
    intent: SettingIntent) -> some View
  {
    SettingView(container: .init(
      intent: intent as SettingIntentType,
      state: state,
      modelChangePublisher: intent.objectWillChange))
  }
}
