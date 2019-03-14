//
//  AppDelegate.swift
//  PlayWheelButton
//
//  Created by Dexter Kim on 2019-03-09.
//  Copyright © 2022 DexCodeMobile All rights reserved.
//

import UIKit
import Photos

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        requestAuthorization()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate {
    
    /// Requests a permission to access the photo library
    func requestAuthorization() {
        let status = PHPhotoLibrary.authorizationStatus()
        guard status != .authorized else { return }
        PHPhotoLibrary.requestAuthorization({ (phAuthorizationStatus) in
            DispatchQueue.main.async {
                if phAuthorizationStatus != .authorized {
                    self.window?.rootViewController?.presentRequestAuthorizationAlert()
                }
            }
        })
    }
}

extension UIViewController {
    
    /// Shows an alert for the permission to access the photo library
    func presentRequestAuthorizationAlert() {
        let title = "Let MyAlbum Access Photo"
        let message = Bundle.main.object(forInfoDictionaryKey: "NSPhotoLibraryUsageDescription") as? String
        let leftButtonTitle = "Not Now"
        let rightButtonTitle = "Enable"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let notnowAction = UIAlertAction(title: leftButtonTitle, style: .default, handler: nil)
        alertController.addAction(notnowAction)
        
        let enableAction = UIAlertAction(title: rightButtonTitle, style: .default, handler: { (action: UIAlertAction) -> Void in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
        })
        alertController.addAction(enableAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
