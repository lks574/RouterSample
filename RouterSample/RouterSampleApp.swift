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


  var body: some Scene {
    let linkNavigator: LinkNavigator = LinkNavigator(enviroment: Enviroment(), routerGroup: RouterGroup())

    return WindowGroup {
      linkNavigator
        .replace(url: "menu-tr://home")
//      LinkNavigator(
      .onOpenURL { url in
        linkNavigator.href(url: url.absoluteString)
//        guard let deeplink = Deeplink(url: url, matching: "deeplink") else { return }
//        DeeplinkHandler.push(navigator: navigator, deeplink: deeplink)
//        print("deeplink", deeplink)
      }
    }
  }
}


