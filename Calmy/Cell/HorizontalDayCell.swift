//
//  HorizontalDayCell.swift
//  Calmy
//
//  Created by Никита Олтян on 30.04.2021.
//

import UIKit

class HorizontalDayCell: UITableViewCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(fontName: "Helvetica-Bold", size: 25)
            .with(autolayout: false)
        return label
    }()

    let colorView: ColorView = {
        let view = ColorView()
            .with(bgColor: Colors.pink)
            .with(autolayout: false)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Colors.pink
        setSubviews()
        activateLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func update(proportions: [Double]?, colors: [String]?, day: Date?) {
        dateLabel.text = "30 апреля"
        colorView.proportions = proportions
        colorView.colors = colors
        colorView.setNeedsDisplay()
    }
}




extension HorizontalDayCell {
    func setSubviews(){
        self.addSubview(dateLabel)
        self.addSubview(colorView)
    }
    
    func activateLayouts(){
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            colorView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 7),
            colorView.leftAnchor.constraint(equalTo: self.leftAnchor),
            colorView.rightAnchor.constraint(equalTo: self.rightAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
