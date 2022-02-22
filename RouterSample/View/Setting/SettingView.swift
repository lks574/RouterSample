import SwiftUI

struct SettingView: IntentBidingType {
  @StateObject var container: Container<SettingIntentType, SettingModel.State>
  var intent: SettingIntentType { container.intent }
  var state: SettingModel.State { intent.state }
  var enviroment: EnviromentType { intent.enviroment }
}

extension SettingView: View {
  var body: some View {
    VStack {
      Text("SettingView")
        .padding()
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
