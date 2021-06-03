//
//  BlockThree+ColorCellTwo.swift
//  Calmy
//
//  Created by Никита Олтян on 14.04.2021.
//

import UIKit

class BlockThree: UIView {

    let label: UILabel = {
        let size: CGFloat = {if MainConstants.screenHeight > 700 {return 24} else {return 22}}()
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica-Bold", size: size)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("block_three_label", comment: "")
        return label
    }()
    
    let colorView: ColorView = {
        let height: CGFloat = {if MainConstants.screenHeight > 740 {return 50} else {return 38}}()
        let view = ColorView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth-70, height: height))
            .with(bgColor: Colors.pink)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stickView: UIView = {
        let height: CGFloat = {if MainConstants.screenHeight > 700 {return 45} else {return 35}}()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 6, height: height))
            .with(bgColor: UIColor.gray.withAlphaComponent(0.5))
            .with(cornerRadius: 3)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let explainLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .center)
            .with(numberOfLines: 1)
            .with(fontName: "Helvetica", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("block_three_explanation", comment: "")
        label.isHidden = true
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        SetSubviews()
        ActivateLayouts()
        updateColorView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    
    func updateColorView() {
        let proportions: [Double] = [0.25, 0.1, 0.15]
        let colors: [String] = ["flickrBlue", "blue", "yellowOchre"]
        colorView.proportions = proportions
        colorView.colors = colors
        colorView.setNeedsDisplay()
    }
    
    func animate() {
        label.center.x -= 350
        colorView.center.x += 350
        UIView.animate(withDuration: 0.5, animations: {
            self.label.center.x += 350
            self.colorView.center.x -= 350
        }, completion: { (_) in
            self.stickView.isHidden = false
            self.explainLabel.isHidden = false
        })
    }
}


extension BlockThree {
    func SetSubviews(){
        self.addSubview(label)
        self.addSubview(colorView)
        self.addSubview(stickView)
        self.addSubview(explainLabel)
    }
    
    func ActivateLayouts() {
        let colorViewTop: CGFloat = {if MainConstants.screenHeight > 700 {return 20} else {return 13}}()
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
            
            colorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            colorView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: colorViewTop),
            colorView.heightAnchor.constraint(equalToConstant: colorView.frame.height),
            colorView.widthAnchor.constraint(equalToConstant: colorView.frame.width),
            
            stickView.topAnchor.constraint(equalTo: colorView.centerYAnchor),
            stickView.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
            stickView.heightAnchor.constraint(equalToConstant: stickView.frame.height),
            stickView.widthAnchor.constraint(equalToConstant: stickView.frame.width),
            
            explainLabel.topAnchor.constraint(equalTo: stickView.bottomAnchor, constant: 5),
            explainLabel.centerXAnchor.constraint(equalTo: stickView.centerXAnchor)
        ])
    }
}
