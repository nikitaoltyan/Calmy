//
//  ViewExtension.swift
//  Calmy
//
//  Created by Никита Олтян on 04.03.2021.
//

import Foundation
import UIKit

extension UIView {
    
    /// Self return UIView with given border width and color.
    /// - parameter borderWidth: View border width
    /// - parameter color: View border color (CGColor)
    func with(borderWidth: CGFloat, color: CGColor) -> Self {
        layer.borderWidth = borderWidth
        layer.borderColor = color
        return self
    }
    
    
    /// Return Self UIView with given background color.
    /// - parameter bgColor: View background color
    func with(bgColor: UIColor) -> Self {
        backgroundColor = bgColor
        return self
    }
    
    
    /// Self return UIView with given corner radius.
    /// - parameter cornerRadius: View corner radius
    func with(cornerRadius: CGFloat) -> Self {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    
    
    func with(autolayout: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = autolayout
        return self
    }
    
    
    func withShadow(size: CGSize) -> Self {
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = size
        return self
    }
    
    
    /// Add a Neomorphism effect to UIView.
    public func addSoftUIEffectForView(cornerRadius: CGFloat = 15.0, themeColor: UIColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1.0)) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize( width: 2, height: 2)
        self.layer.shadowColor = UIColor(red: 233/255, green: 130/255, blue: 114/255, alpha: 1).cgColor
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.backgroundColor = themeColor.cgColor
        shadowLayer.shadowColor = UIColor.white.cgColor
        shadowLayer.cornerRadius = cornerRadius
        shadowLayer.shadowOffset = CGSize(width: -2.0, height: -2.0)
        shadowLayer.shadowOpacity = 0.95
        shadowLayer.shadowRadius = 6
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
}
