//
//  UIColor+SAK.swift
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit
import HexColors

extension UIColor {
    
    static func app_globalTintColor() -> UIColor { return UIColor.black }
    static func app_buttonColor() -> UIColor { return app_greenColor() }
    static func app_buttonTextColor() -> UIColor { return UIColor.white }
    
    static func app_lightGreenColor() -> UIColor { return UIColor("d2f7a5")! }
    static func app_greenColor() -> UIColor { return UIColor("b0d325")! }
    static func app_darkGreenColor() -> UIColor { return UIColor("263a0c")! }
    static func app_redColor() -> UIColor { return UIColor("f56757")! }
    static func app_darkRedColor() -> UIColor { return UIColor("d1554b")! }
    static func app_yellowColor() -> UIColor { return UIColor("efb206")! }
    static func app_lightGrayColor() -> UIColor { return UIColor("efeff4")! }
    static func app_mediumGrayColor() -> UIColor { return UIColor("cccccc")! }
    static func app_grayColor() -> UIColor { return UIColor("909090")! }
    static func app_darkGrayColor() -> UIColor { return UIColor("808080")! }
    static func app_mediumBlueColor() -> UIColor { return UIColor("5B5BC0")! }
    static func app_darkBlueColor() -> UIColor { return UIColor("191970")! }
}

