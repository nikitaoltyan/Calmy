//
//  OnboardingCell.swift
//  Calmy
//
//  Created by Никита Олтян on 01.04.2021.
//

import UIKit

class OnboardingCellOne: UICollectionViewCell {
    
    let logoView: LogoView = {
        let view = LogoView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth-90, height: 300))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.backgroundColor = Colors.pink
        SetSubview()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}




extension OnboardingCellOne {
    
    func SetSubview() {
        self.addSubview(logoView)
        self.addSubview(largeLabel)
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 15),
            logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            logoView.heightAnchor.constraint(equalToConstant: logoView.frame.height),
            logoView.widthAnchor.constraint(equalToConstant: logoView.frame.width),
            
            largeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            largeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80)
        ])
    }
}
