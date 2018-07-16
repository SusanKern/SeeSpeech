//
//  SAKDefaults.swift
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//


import UIKit

class SAKDefaults: NSObject {
    
    // MARK: NSUserDefaults Keys
    
    static let launchCountKey = "launchCount"


    // MARK: Accessors

    static func launchCount() -> Int {
        return Foundation.UserDefaults.standard.integer(forKey: launchCountKey)
    }

    static func incrementLaunchCount() {
        let newLaunchCount = launchCount() + 1
        Foundation.UserDefaults.standard.set(newLaunchCount, forKey: launchCountKey)
        Foundation.UserDefaults.standard.synchronize()
    }

    static func resetKeys(_ keys: [String]) {
        for key in keys {
            Foundation.UserDefaults.standard.removeObject(forKey: key)
        }
    }
}
