//
//  BlockTwo+ColorCellOne.swift
//  Calmy
//
//  Created by Никита Олтян on 14.04.2021.
//

import UIKit

class BlockTwo: UIView {

    let label: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("block_two_label", comment: "")
        return label
    }()
    
    let colorView: ColorView = {
        let view = ColorView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth-70, height: 50))
            .with(bgColor: Colors.pink)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stickViewOne: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: 45))
            .with(bgColor: UIColor.gray.withAlphaComponent(0.5))
            .with(cornerRadius: 3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stickViewTwo: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: 45))
            .with(bgColor: UIColor.gray.withAlphaComponent(0.5))
            .with(cornerRadius: 3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let explainLabelOne: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 1)
            .with(fontName: "Helvetica", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("block_two_explanation_one", comment: "")
        return label
    }()
    
    let explainLabelTwo: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .right)
            .with(numberOfLines: 1)
            .with(fontName: "Helvetica", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("block_two_explanation_two", comment: "")
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
        let proportions: [Double] = [0.25, 0.1, 0.15, 0.12, 0.13, 0.25]
        let colors: [String] = ["flickrBlue", "blue", "yellowOchre", "redwood", "white", "black"]
        colorView.proportions = proportions
        colorView.colors = colors
        colorView.setNeedsDisplay()
    }
}



extension BlockTwo {
    func SetSubviews(){
        self.addSubview(label)
        self.addSubview(colorView)
        self.addSubview(stickViewOne)
        self.addSubview(stickViewTwo)
        self.addSubview(explainLabelOne)
        self.addSubview(explainLabelTwo)
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
            
            stickViewOne.topAnchor.constraint(equalTo: colorView.centerYAnchor),
            stickViewOne.leftAnchor.constraint(equalTo: colorView.leftAnchor, constant: 5),
            stickViewOne.heightAnchor.constraint(equalToConstant: stickViewOne.frame.height),
            stickViewOne.widthAnchor.constraint(equalToConstant: stickViewOne.frame.width),
            
            explainLabelOne.topAnchor.constraint(equalTo: stickViewOne.bottomAnchor, constant: 5),
            explainLabelOne.leftAnchor.constraint(equalTo: stickViewOne.leftAnchor),
            
            stickViewTwo.topAnchor.constraint(equalTo: colorView.centerYAnchor),
            stickViewTwo.rightAnchor.constraint(equalTo: colorView.rightAnchor, constant: -5),
            stickViewTwo.heightAnchor.constraint(equalToConstant: stickViewTwo.frame.height),
            stickViewTwo.widthAnchor.constraint(equalToConstant: stickViewTwo.frame.width),
            
            explainLabelTwo.topAnchor.constraint(equalTo: stickViewTwo.bottomAnchor, constant: 5),
            explainLabelTwo.rightAnchor.constraint(equalTo: stickViewTwo.rightAnchor),
        ])
    }
}
