//
//  OnboardingCellTwo.swift
//  Calmy
//
//  Created by Никита Олтян on 01.04.2021.
//

import UIKit

class OnboardingCellTwo: UICollectionViewCell {
    
    let largeLabel: UILabel = {
        let size: CGFloat = {if MainConstants.screenHeight > 700 {return 35} else {return 30}}()
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 2)
            .with(fontName: "Helvetica-Bold", size: size)
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
    
    let block: BlockOne = {
        let view = BlockOne(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth, height: 165))
            .with(bgColor: .clear)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let nextButton: ButtonView = {
        let view = ButtonView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth-70, height: 53))
            .with(cornerRadius: 25)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.label.text = NSLocalizedString("next_slide", comment: "")
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
        Vibration.soft()
        if (block.isHidden) {
            block.isHidden = false
            block.animate()
        } else {
            delegate?.NextSlide(slide: 2)
        }
    }
}




extension OnboardingCellTwo {
    
    func SetSubview() {
        self.addSubview(largeLabel)
        self.addSubview(explanationLabel)
        self.addSubview(block)
        self.addSubview(nextButton)
        
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NextSlide)))
    }
    
    func ActivateLayouts() {
        let largeLabelTop: CGFloat = {if MainConstants.screenHeight>740 {return 120} else {return 60}}()
        let blockTop: CGFloat = {if MainConstants.screenHeight>700 {return 75} else {return 30}}()
        let buttonBottom: CGFloat = {if MainConstants.screenHeight>700 {return -70} else {return -35}}()
        NSLayoutConstraint.activate([
            largeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: largeLabelTop),
            largeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            largeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
            
            explanationLabel.topAnchor.constraint(equalTo: largeLabel.bottomAnchor, constant: 25),
            explanationLabel.leftAnchor.constraint(equalTo: largeLabel.leftAnchor),
            explanationLabel.rightAnchor.constraint(equalTo: largeLabel.rightAnchor),
            
            block.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: blockTop),
            block.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            block.heightAnchor.constraint(equalToConstant: block.frame.height),
            block.widthAnchor.constraint(equalToConstant: block.frame.width),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: buttonBottom),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: nextButton.frame.width),
            nextButton.heightAnchor.constraint(equalToConstant: nextButton.frame.height)
        ])
    }
}
