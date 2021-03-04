//
//  SetColorCell.swift
//  Calmy
//
//  Created by Никита Олтян on 04.03.2021.
//

import UIKit

class SetColorCell: UICollectionViewCell {
    
    lazy var colorView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width*4/5, height: self.frame.height/3))
        view.addSoftUIEffectForView(cornerRadius: 15, themeColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let colorLabel: UILabel = {
        let label = UILabel()
            .with(color: .black)
            .with(alignment: .left)
            .with(fontName: "Helvetica-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color"
        return label
    }()
    
    let desc: UITextView = {
        let view = UITextView()
            .with(bgColor: .clear)
            .with(fontName: "Helvetica", size: 15)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.isScrollEnabled = false
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Some custom description. Some custom description. \nSome custom description. Some custom description. Some custom description."
        return view
    }()
    
    lazy var buttonView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width*4/5, height: 60))
        view.addSoftUIEffectForView(cornerRadius: 10, themeColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.pink
        SetSubview()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension SetColorCell {
    func SetSubview(){
        self.addSubview(colorView)
        self.addSubview(colorLabel)
        self.addSubview(desc)
        self.addSubview(buttonView)
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            colorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            colorView.heightAnchor.constraint(equalToConstant: colorView.frame.height),
            colorView.widthAnchor.constraint(equalToConstant: colorView.frame.width),
            
            colorLabel.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 15),
            colorLabel.leftAnchor.constraint(equalTo: colorView.leftAnchor),
            
            desc.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 8),
            desc.leftAnchor.constraint(equalTo: colorView.leftAnchor),
            desc.rightAnchor.constraint(equalTo: colorView.rightAnchor),
            
            buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            buttonView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: buttonView.frame.height),
            buttonView.widthAnchor.constraint(equalToConstant: buttonView.frame.width),
        ])
    }
}
