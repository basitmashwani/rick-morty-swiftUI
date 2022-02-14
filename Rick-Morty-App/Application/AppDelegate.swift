//
//  AppDelegate.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 04/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let appDIContainer = AppDIContainer()
    var appCoordinator: AppCoordinator?
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController()
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        appCoordinator = AppCoordinator(parent: navigation, appServiceLocator: appDIContainer)
        appCoordinator?.start()
    }
}
