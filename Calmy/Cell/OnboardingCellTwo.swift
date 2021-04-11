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
        label.text = NSLocalizedString("onboarding_large_label", comment: "")
        return label
    }()
    
    let explanationLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica", size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("onboarding_explanation", comment: "")
        return label
    }()
    
    let nextButton: ButtonView = {
        let view = ButtonView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth-70, height: 53))
            .with(cornerRadius: 25)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.label.text = NSLocalizedString("end", comment: "")
        view.label.font = UIFont(name: "SFPro", size: 16)
        return view
    }()
    
    var delegate: OnboardingDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.pink
        SetSubview()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    @objc func Finish() {
        delegate?.Finish()
    }
}




extension OnboardingCellTwo {
    
    func SetSubview() {
        self.addSubview(largeLabel)
        self.addSubview(explanationLabel)
        self.addSubview(nextButton)
        
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Finish)))
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            largeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            largeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            largeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
            
            explanationLabel.topAnchor.constraint(equalTo: largeLabel.bottomAnchor, constant: 45),
            explanationLabel.leftAnchor.constraint(equalTo: largeLabel.leftAnchor),
            explanationLabel.rightAnchor.constraint(equalTo: largeLabel.rightAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: nextButton.frame.width),
            nextButton.heightAnchor.constraint(equalToConstant: nextButton.frame.height)
        ])
    }
}
