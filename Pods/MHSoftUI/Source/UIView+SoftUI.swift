//
//  UIView+SoftUI.swift
//  SoftUI
//
//  Created by Mumtaz on 21/01/2020.
//  Copyright © 2020 Mumtaz. All rights reserved.
//

import UIKit

extension UIView {
    
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
