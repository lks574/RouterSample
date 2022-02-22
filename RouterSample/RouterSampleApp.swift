//
//  RouterSampleApp.swift
//  RouterSample
//
//  Created by kyungseok.lee_Flitto on 2022/02/07.
//

import SwiftUI

@main
struct RouterSampleApp: App {

  var enviroment: Enviroment {
    Enviroment()
  }
  var linkNavigator: LinkNavigator  {
    LinkNavigator(enviroment: Enviroment())
  }

  var body: some Scene {

    return WindowGroup {
      linkNavigator
        .replace(url: "menu-tr://home")
//      LinkNavigator(
      .onOpenURL { url in
        linkNavigator.herf(url: url.absoluteString)
//        guard let deeplink = Deeplink(url: url, matching: "deeplink") else { return }
//        DeeplinkHandler.push(navigator: navigator, deeplink: deeplink)
//        print("deeplink", deeplink)
      }
    }
  }
}


