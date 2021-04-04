//
//  OnboardingCell.swift
//  Calmy
//
//  Created by Никита Олтян on 01.04.2021.
//

import UIKit

class OnboardingCellOne: UICollectionViewCell {
    
    let iconImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let largeLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica-Bold", size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetSubview()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}




extension OnboardingCellOne {
    
    func SetSubview() {
        self.addSubview(iconImage)
        self.addSubview(largeLabel)
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            iconImage.heightAnchor.constraint(equalToConstant: iconImage.frame.height),
            iconImage.widthAnchor.constraint(equalToConstant: iconImage.frame.width),
            
            largeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            largeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80)
        ])
    }
}
