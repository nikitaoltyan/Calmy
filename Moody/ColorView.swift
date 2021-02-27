//
//  ColorView.swift
//  Moody
//
//  Created by Никита Олтян on 27.02.2021.
//

import UIKit

class ColorView: UIView {

    override func draw(_ rect: CGRect) {
        let number = CGFloat.random(in: 0.3...3)
        super.draw(rect)
        let topRect = CGRect(x: 0, y: 0, width: rect.size.width/number, height: rect.size.height)
        UIColor(red: 53/255, green: 80/255, blue: 112/255, alpha: 1).set()
        guard let topContext = UIGraphicsGetCurrentContext() else { return }
        topContext.fill(topRect)
        
        let setWidth = rect.size.width - rect.size.width/number
        let middleRect = CGRect(x: rect.size.width/number, y: 0, width: setWidth, height: rect.size.height)
        UIColor(red: 109/255, green: 89/255, blue: 122/255, alpha: 1).set()
        guard let middleContext = UIGraphicsGetCurrentContext() else { return }
        middleContext.fill(middleRect)
    }

}
