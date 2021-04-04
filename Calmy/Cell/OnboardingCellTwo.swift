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
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica-Bold", size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let explanationLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica", size: 29)
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




extension OnboardingCellTwo {
    
    func SetSubview() {
        self.addSubview(largeLabel)
        self.addSubview(explanationLabel)
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            largeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            largeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            
            
        ])
    }
}
