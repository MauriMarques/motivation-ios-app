//
//  AppDelegate.swift
//  Motivation
//
//  Created by Maurício Marques on 22/04/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = {
        let window = UIWindow()
        window.rootViewController = ViewController()
        return window
    }()

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window?.makeKeyAndVisible()
        return true
    }
}
