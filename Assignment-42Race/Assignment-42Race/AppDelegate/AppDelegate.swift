//
//  AppDelegate.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 24/07/2022.
//

import UIKit
import Data
import Domain

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
    enum Constant {
        static let apiKey = "syN96LXt2TkazOkP93nc5vTqDMCLrJIcITZx9cMsmTey0z6oXcT6phQNEbCuTfpwZTvwVB7nw16Br-JZ5fJLQjcc42Jjn2cH-6OD3aBPXBhOK4RgftA3SXdEP6DeYnYx"
     static let baseURL = "https://api.yelp.com/v3"
    }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    DependencyInjection.registerAll()
    configAPIClient()
    initRootView()
    return true
  }
  
  private func configAPIClient() {
      guard let url = URL(string: Constant.baseURL) else { return }
      APIClient.shared.set(baseURL: url, key: Constant.apiKey)
  }
  
  private func initRootView() {
     guard let businessSearchVC = container.resolve(BusinessSearchViewController.self) else { return }
      let nav = UINavigationController(rootViewController: businessSearchVC)
      window?.rootViewController = nav
      window?.makeKeyAndVisible()
  }
 

}

