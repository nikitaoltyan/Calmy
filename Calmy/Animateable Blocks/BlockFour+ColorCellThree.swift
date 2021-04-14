//
//  BlockFour+ColorCellThree.swift
//  Calmy
//
//  Created by Никита Олтян on 14.04.2021.
//

import UIKit

class BlockFour: UIView {

    let label: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("block_four_label", comment: "")
        return label
    }()
    
    let colorView: ColorView = {
        let view = ColorView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth-70, height: 50))
            .with(bgColor: Colors.pink)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stickView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: 45))
            .with(bgColor: UIColor.gray.withAlphaComponent(0.5))
            .with(cornerRadius: 3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let explainLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .center)
            .with(numberOfLines: 1)
            .with(fontName: "Helvetica", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("block_four_explanation", comment: "")
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        SetSubviews()
        ActivateLayouts()
        UpdateColorView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    
    func UpdateColorView() {
        let proportions: [Double] = [0.25, 0.1, 0.15, 0.12]
        let colors: [String] = ["flickrBlue", "blue", "yellowOchre", "redwood"]
        colorView.proportions = proportions
        colorView.colors = colors
        colorView.setNeedsDisplay()
    }
}





extension BlockFour {
    func SetSubviews(){
        self.addSubview(label)
        self.addSubview(colorView)
        self.addSubview(stickView)
        self.addSubview(explainLabel)
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
            
            colorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            colorView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            colorView.heightAnchor.constraint(equalToConstant: colorView.frame.height),
            colorView.widthAnchor.constraint(equalToConstant: colorView.frame.width),
            
            stickView.topAnchor.constraint(equalTo: colorView.centerYAnchor),
            stickView.centerXAnchor.constraint(equalTo: colorView.centerXAnchor, constant: colorView.frame.width*0.12),
            stickView.heightAnchor.constraint(equalToConstant: stickView.frame.height),
            stickView.widthAnchor.constraint(equalToConstant: stickView.frame.width),
            
            explainLabel.topAnchor.constraint(equalTo: stickView.bottomAnchor, constant: 5),
            explainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
