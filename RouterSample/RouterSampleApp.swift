//
//  RouterSampleApp.swift
//  RouterSample
//
//  Created by kyungseok.lee_Flitto on 2022/02/07.
//

import SwiftUI

@main
struct RouterSampleApp: App {

  var body: some Scene {
    let navigator = DeepNavi()
    NavigationMap.initialize(navigator: navigator)

    return WindowGroup {
      navigator.start()
      .onOpenURL { url in
        guard let deeplink = Deeplink(url: url, matching: "deeplink") else { return }
        DeeplinkHandler.push(navigator: navigator, deeplink: deeplink)
        print("deeplink", deeplink)
      }
    }
  }
}


