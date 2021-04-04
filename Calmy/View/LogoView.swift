//
//  LogoView.swift
//  Calmy
//
//  Created by Никита Олтян on 04.04.2021.
//

import UIKit

class LogoView: UIView {
    
    lazy var firstSquare: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.height/3, height: self.frame.height/3))
            .with(bgColor: Colors.logoColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var secondSquare: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.height/3, height: self.frame.height/3))
            .with(bgColor: Colors.logoColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var thirdSquare: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.height/3, height: self.frame.height/3))
            .with(bgColor: Colors.logoColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var turnedSquare: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.height/4, height: self.frame.height/4))
            .with(bgColor: Colors.logoColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.transform = CGAffineTransform(rotationAngle: .pi/4)
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        SetSubview()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}





extension LogoView {
    func SetSubview() {
        self.addSubview(firstSquare)
        self.addSubview(secondSquare)
        self.addSubview(thirdSquare)
        self.addSubview(turnedSquare)
    }
    
    func ActivateLayouts() {
        NSLayoutConstraint.activate([
            firstSquare.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            firstSquare.leftAnchor.constraint(equalTo: self.leftAnchor),
            firstSquare.widthAnchor.constraint(equalToConstant: firstSquare.frame.width),
            firstSquare.heightAnchor.constraint(equalToConstant: firstSquare.frame.height),
            
            secondSquare.leftAnchor.constraint(equalTo: firstSquare.rightAnchor),
            secondSquare.bottomAnchor.constraint(equalTo: firstSquare.topAnchor),
            secondSquare.widthAnchor.constraint(equalToConstant: secondSquare.frame.width),
            secondSquare.heightAnchor.constraint(equalToConstant: secondSquare.frame.height),
            
            thirdSquare.topAnchor.constraint(equalTo: firstSquare.bottomAnchor),
            thirdSquare.leftAnchor.constraint(equalTo: firstSquare.rightAnchor),
            thirdSquare.widthAnchor.constraint(equalToConstant: thirdSquare.frame.width),
            thirdSquare.heightAnchor.constraint(equalToConstant: thirdSquare.frame.height),
            
            turnedSquare.centerYAnchor.constraint(equalTo: firstSquare.centerYAnchor),
            turnedSquare.leftAnchor.constraint(equalTo: firstSquare.rightAnchor, constant: 90),
            turnedSquare.widthAnchor.constraint(equalToConstant: turnedSquare.frame.width),
            turnedSquare.heightAnchor.constraint(equalToConstant: turnedSquare.frame.height)
        ])
    }
}
