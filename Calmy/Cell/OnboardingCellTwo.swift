//
//  OnboardingCellTwo.swift
//  Calmy
//
//  Created by Никита Олтян on 01.04.2021.
//

import UIKit

class OnboardingCellTwo: UICollectionViewCell {
    
    let largeLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 2)
            .with(fontName: "Helvetica-Bold", size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let explanationLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.pink
        SetSubview()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}




extension OnboardingCellTwo {
    
    func SetSubview() {
        self.addSubview(largeLabel)
        self.addSubview(explanationLabel)
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            largeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            largeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            largeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
            
            explanationLabel.topAnchor.constraint(equalTo: largeLabel.bottomAnchor, constant: 50),
            explanationLabel.leftAnchor.constraint(equalTo: largeLabel.leftAnchor),
            explanationLabel.rightAnchor.constraint(equalTo: largeLabel.rightAnchor)
        ])
    }
}
