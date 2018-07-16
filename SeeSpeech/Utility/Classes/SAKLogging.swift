//
//  SAKLogging.swift
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import Foundation
import SwiftyBeaver

let log = SwiftyBeaver.self

class SAKLogging {
    
    static func initialize() {
        let console = ConsoleDestination()  // log to Xcode Console
        let file = FileDestination()  // log to default swiftybeaver.log file
        log.addDestination(console)
        log.addDestination(file)
        log.info("Logging initialized")
    }
}
