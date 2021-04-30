//
//  ColorDayCell.swift
//  Moody
//
//  Created by Никита Олтян on 27.02.2021.
//

import UIKit

class ColorDayCell: UITableViewCell {

    let colorView: ColorView = {
        let view = ColorView()
            .with(bgColor: Colors.pink)
            .with(autolayout: false)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
        activateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func updateColorView(proportions: [Double]?, colors: [String]?) {
        colorView.proportions = proportions
        colorView.colors = colors
        colorView.setNeedsDisplay()
    }
}




extension ColorDayCell {
    
    func setSubviews(){
        self.addSubview(colorView)
    }
    
    func activateLayouts(){
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            colorView.leftAnchor.constraint(equalTo: self.leftAnchor),
            colorView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
}
