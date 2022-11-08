//
//  AppDelegate.swift
//  Example Project
//
//  Created by Nikola Veljic on 2.11.22..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.overrideUserInterfaceStyle = .dark
        
        AccountManager.shared.onStart()
        
        return true
    }

}

