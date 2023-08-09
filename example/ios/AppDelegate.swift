//
//  AppDelegate.swift
//  example2
//
//  Created by Mathias Marc Jensen on 08/08/2023.
//

import TikTokOpenSDKCore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var bridge: RCTBridge!
  var bridge2: RCTBundleURLProvider!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let jsCodeLocation: URL
    jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackExtension: nil)
    let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "example2", initialProperties: nil, launchOptions: launchOptions)
    let rootViewController = UIViewController()
    rootViewController.view = rootView

    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = rootViewController
    self.window?.makeKeyAndVisible()

    return true
  }
  
  func application(_ app: UIApplication,open url: URL,
                   options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      if (TikTokURLHandler.handleOpenURL(url)) {
          return true
      }
      return false
  }
  
  func application(_ application: UIApplication,
                   continue userActivity: NSUserActivity,
                   restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
      if (TikTokURLHandler.handleOpenURL(userActivity.webpageURL)) {
          return true
      }
      return false
  }
}
