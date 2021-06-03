//
//  HorizontalDayCell.swift
//  Calmy
//
//  Created by Никита Олтян on 30.04.2021.
//

import UIKit

protocol HorizontalDayCellDelegate {
    func warningAction()
}

class HorizontalDayCell: UITableViewCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(fontName: "Helvetica", size: 22)
            .with(autolayout: false)
        return label
    }()

    let colorView: ColorView = {
        let view = ColorView()
            .with(bgColor: Colors.pink)
            .with(autolayout: false)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let warning: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 27, height: 27))
            .with(autolayout: false)
        button.setImage(UIImage(systemName: "exclamationmark.circle"), for: .normal)
        button.tintColor = Colors.redWarning
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.isHidden = true
        return button
    }()
    
    var delegate: HorizontalDayCellDelegate?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        self.backgroundColor = Colors.pink
        setSubviews()
        activateLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func update(proportions: [Double]?, colors: [String]?, day: Date?) {
        guard let date = day else {return}
        dateLabel.text = "\(date.day) \(date.month)"
        colorView.proportions = proportions
        colorView.colors = colors
        colorView.setNeedsDisplay()
        let condition = Functions.checkMoodCondition(colors: colors, proportions: proportions, day: date)
        if (condition) {
            warning.isHidden = false
            warning.isUserInteractionEnabled = true
        }
        else { warning.isHidden = true }
    }
    
    @objc func warningAction(){
        delegate?.warningAction()
    }
}




extension HorizontalDayCell {
    func setSubviews(){
        self.addSubview(dateLabel)
        self.addSubview(colorView)
        self.addSubview(warning)
        
        warning.addTarget(self, action: #selector(warningAction), for: .touchUpInside)
    }
    
    func activateLayouts(){
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            colorView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 7),
            colorView.leftAnchor.constraint(equalTo: self.leftAnchor),
            colorView.rightAnchor.constraint(equalTo: self.rightAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            warning.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            warning.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            warning.heightAnchor.constraint(equalToConstant: warning.frame.height),
            warning.widthAnchor.constraint(equalToConstant: warning.frame.width),
        ])
    }
}
