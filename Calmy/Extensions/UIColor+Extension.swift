//
//  UIColor+Extension.swift
//  Calmy
//
//  Created by Никита Олтян on 30.04.2021.
//

import Foundation
import UIKit

extension UIColor {
    /// - returns: turple with red, green, blue and alpha components of the color.
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
    
    var reverseColor: Self {
        let (red, green, blue, _) = self.rgba
        return Self.init(red: (1-red), green: (1-green), blue: (1-blue), alpha: 1)
    }
}
