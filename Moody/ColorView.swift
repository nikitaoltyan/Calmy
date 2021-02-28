//
//  ColorView.swift
//  Moody
//
//  Created by Никита Олтян on 27.02.2021.
//

import UIKit

class ColorView: UIView {
    
    var proportion: CGFloat?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let prop: Array<CGFloat> = [0.2,  0.3, 0.5]
        let colors = [UIColor(red: 53/255, green: 80/255, blue: 112/255, alpha: 1),
                      UIColor(red: 109/255, green: 89/255, blue: 122/255, alpha: 1),
                      .purple]
        var curX: CGFloat = 0
        for i in 0...prop.count-1 {
            let rect = CGRect(x: curX, y: 0, width: rect.size.width * prop[i], height: rect.size.height)
            colors[i].set()
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.fill(rect)
            curX += rect.width
        }
    }

    
    func CreateReacts(){
        
    }
}
