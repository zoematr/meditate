//
//  AppDelegateClass.swift
//  meditate
//
//  Created by Zoe Matrullo on 27/11/22.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let backarrow = UIImage(named: "arrow.left")?.withTintColor(UIColor(CustomColor.brown))
        UINavigationBar.appearance().backIndicatorImage = backarrow
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backarrow
        UINavigationBar.appearance().tintColor = UIColor(CustomColor.brown)
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor(CustomColor.brown)
        ], for: .normal)
        return true
    }
}
