//
//  AppDelegate.swift
//  FaceDiary
//
//  Created by 松浦裕久 on 2021/11/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Window
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Windowのインスタンス化
        window = UIWindow(frame: UIScreen.main.bounds)
        // 最初に起動するViewController
        let vc = TopViewController()
        // NavigationController
        let navC = UINavigationController(rootViewController: vc)
        // Windowの親ViewControllerを指定
        window?.rootViewController = navC
        // Windowを前面に表示
        window?.makeKeyAndVisible()
        
        return true
    }


}

