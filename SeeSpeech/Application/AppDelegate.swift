//
//  AppDelegate.swift
//  SeeSpeech
//
//  Created by Susan Kern on 7/13/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Public variables

    var window: UIWindow?

    
    // MARK: Private variables
    
    fileprivate var _speechController: SpeechController = {
        return SpeechController()
    }()
    
    
    // MARK: Application life-cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        SAKLogging.initialize()

        // Appearance
        self.customizeAppearance(application)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        log.info("WillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        log.info("DidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        log.info("WillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        log.info("DidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        log.info("WillTerminate")
    }

    // MARK: Appearance
    
    private func customizeAppearance(_ application: UIApplication) {
        // Global tint
        self.window?.tintColor = UIColor.app_globalTintColor()
    }
}


// MARK: Singletons

extension SpeechController {
    static var sharedInstance: SpeechController {
        return (UIApplication.shared.delegate as! AppDelegate)._speechController
    }
}

