//
//  AppDelegate.swift
//  Localiazation
//
//  Created by Asmaa Tarek on 24/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        LanguageManager.shared.changeSemanticContentAttribute()
        window?.rootViewController = WelcomeViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

