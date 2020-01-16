//
//  AppDelegate.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        makeSettingUI()
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .color_353331
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = SPTabBarViewController()
        return true
    }
    
    private func makeSettingUI() {
        // nav
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.color_FFFFFF, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        UINavigationBar.appearance().barTintColor = .color_353331
        UINavigationBar.appearance().tintColor = .color_FFFFFF
        
        //tableView
        UITableView.appearance().separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        UITableView.appearance().separatorColor = .color_E8E8E8
        UITableView.appearance().tableFooterView = UIView()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

}

