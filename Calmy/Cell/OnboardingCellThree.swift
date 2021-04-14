//
//  OnboardingCellThree.swift
//  Calmy
//
//  Created by Никита Олтян on 14.04.2021.
//

import UIKit

class OnboardingCellThree: UICollectionViewCell {
    
    let blockTwo: BlockTwo = {
        let view = BlockTwo(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth, height: 140))
            .with(bgColor: .clear)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let blockThree: BlockThree = {
        let view = BlockThree(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth, height: 140))
            .with(bgColor: .clear)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let blockFour: BlockFour = {
        let view = BlockFour(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth, height: 140))
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
        SetSubviews()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    @objc func NextSlide() {
        if (blockThree.isHidden) {
            Vibration.Soft()
            blockThree.isHidden = false
        } else if (blockFour.isHidden){
            Vibration.Soft()
            blockFour.isHidden = false
            nextButton.label.text = NSLocalizedString("end", comment: "")
        } else {
            delegate?.Finish()
        }
    }
}






extension OnboardingCellThree {
    func SetSubviews(){
        self.addSubview(blockTwo)
        self.addSubview(blockThree)
        self.addSubview(blockFour)
        self.addSubview(nextButton)
        
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(NextSlide)))
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            blockTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            blockTwo.topAnchor.constraint(equalTo: self.topAnchor, constant: 105),
            blockTwo.widthAnchor.constraint(equalToConstant: blockTwo.frame.width),
            blockTwo.heightAnchor.constraint(equalToConstant: blockTwo.frame.height),
            
            blockThree.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            blockThree.topAnchor.constraint(equalTo: blockTwo.bottomAnchor, constant: 70),
            blockThree.widthAnchor.constraint(equalToConstant: blockThree.frame.width),
            blockThree.heightAnchor.constraint(equalToConstant: blockThree.frame.height),
            
            blockFour.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            blockFour.topAnchor.constraint(equalTo: blockThree.bottomAnchor, constant: 58),
            blockFour.widthAnchor.constraint(equalToConstant: blockFour.frame.width),
            blockFour.heightAnchor.constraint(equalToConstant: blockFour.frame.height),
            
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
            nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: nextButton.frame.width),
            nextButton.heightAnchor.constraint(equalToConstant: nextButton.frame.height)
        ])
    }
}
