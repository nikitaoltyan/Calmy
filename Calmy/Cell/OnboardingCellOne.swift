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
        label.text = "Добро пожаловать в Calmy – простой трекер настроения"
        return label
    }()
    
    let nextButton: ButtonView = {
        let view = ButtonView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth-70, height: 53))
            .with(cornerRadius: 25)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.label.text = "ПРОДОЛЖИТЬ"
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
    
    
    @objc func NextSlide() {
        print("Next slide")
        delegate?.NextSlide()
    }
}




extension OnboardingCellOne {
    
    func SetSubview() {
        self.addSubview(logoView)
        self.addSubview(largeLabel)
        self.addSubview(nextButton)
        
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NextSlide)))
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 15),
            logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            logoView.heightAnchor.constraint(equalToConstant: logoView.frame.height),
            logoView.widthAnchor.constraint(equalToConstant: logoView.frame.width),
            
            largeLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 60),
            largeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            largeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: nextButton.frame.width),
            nextButton.heightAnchor.constraint(equalToConstant: nextButton.frame.height)
        ])
    }
}
