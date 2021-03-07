//
//  ColorView.swift
//  Moody
//
//  Created by Никита Олтян on 27.02.2021.
//

import UIKit

class ColorView: UIView {
    
    var proportions: [Double]?
    var colors: [String]?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("Override view draw")
        var prop = proportions
        if let sum = prop?.reduce(0, +) {
            if sum < 1 {
                prop?.append(1 - sum)
                colors?.append("pink")
            }
        }
        guard ((prop?.count ?? 0) == (colors?.count ?? 0)) else { return }
        
        var curX: CGFloat = 0
        for i in 0...(prop?.count ?? 1)-1 {
            let rect = CGRect(x: curX, y: 0, width: rect.size.width * CGFloat(prop![i]), height: rect.size.height)
            UIColor(named: colors![i])?.set()
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.fill(rect)
            curX += rect.width
        }
    }

}
