//
//  AlertView+Extension.swift
//  Calmy
//
//  Created by Никита Олтян on 07.05.2021.
//

import Foundation
import UIKit

extension UIAlertController {
    /// Removing "Breaking constraints" glitch
    var removeBreakingConstraints: Self {
        for subview in self.view.subviews {
            for constraint in subview.constraints {
                if constraint.firstAttribute == .width && constraint.constant == -16 {
                    constraint.constant = 10 // Any positive value
                }
            }
        }
        return self
    }
}
