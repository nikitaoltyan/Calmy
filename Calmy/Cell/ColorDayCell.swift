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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.pink
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        SetSubviews()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func UpdateColorView(proportions: [Double]?, colors: [String]?) {
        colorView.proportions = proportions
        colorView.colors = colors
        colorView.setNeedsDisplay()
    }
}




extension ColorDayCell {
    
    func SetSubviews(){
        self.addSubview(colorView)
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            colorView.leftAnchor.constraint(equalTo: self.leftAnchor),
            colorView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
}
