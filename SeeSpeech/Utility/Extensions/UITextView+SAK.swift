//
//  UITextView+SAK.swift
//
//  Created by Susan Kern on 7/13/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

extension UITextView {
    
    func scrollToBottom() {
        if self.text.count > 0 {
            let location = self.text.count - 1
            let bottom = NSMakeRange(location, 1)
            self.scrollRangeToVisible(bottom)
        }
    }
}

