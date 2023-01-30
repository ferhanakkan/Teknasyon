//
//  AppDelegate.swift
//  Teknasyon
//
//  Created by Ferhan Akkan on 30.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties

    var window: UIWindow?
    var mainCoordinator: Coordinator?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        setWindow()

        return true
    }
}

// MARK: Privates

private extension AppDelegate {

    func setWindow() {
        window = .init(frame: UIScreen.main.bounds)
        self.mainCoordinator = MainCoordinator()
        mainCoordinator?.startCoordinator()
        window?.rootViewController = mainCoordinator?.navigationController
        window?.makeKeyAndVisible()
    }
}
