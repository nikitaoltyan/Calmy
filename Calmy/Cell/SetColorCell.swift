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
            .with(cornerRadius: 23)
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
            .with(fontName: "Helvetica", size: 16)
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
        view.addSoftUIEffectForView(cornerRadius: 10, themeColor: Colors.pink)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let selectLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.shadow)
            .with(alignment: .center)
            .with(fontName: "Helvetica-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Выбрать"
        return label
    }()
    
    var delegate: SetColorCellProtocol?
    var color: String?
    var proportion: CGFloat?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        SetSubview()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func AddColor() {
        print("Add color")
        delegate?.CloseView()
        let date = Date()
        let day: String = "\(date.day)_\(date.month)_\(date.year)"
        delegate?.AddData(proportion: Double(TimeFunctions.GetTime()), color: color!, forDate: day)
    }
}




extension SetColorCell {
    func SetSubview(){
        self.addSubview(colorView)
        self.addSubview(colorLabel)
        self.addSubview(desc)
        self.addSubview(buttonView)
        buttonView.addSubview(selectLabel)
        
        buttonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddColor)))
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            colorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            colorView.heightAnchor.constraint(equalToConstant: colorView.frame.height),
            colorView.widthAnchor.constraint(equalToConstant: colorView.frame.width),
            
            colorLabel.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 15),
            colorLabel.leftAnchor.constraint(equalTo: colorView.leftAnchor, constant: -2),
            
            desc.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 8),
            desc.leftAnchor.constraint(equalTo: colorLabel.leftAnchor, constant: -3),
            desc.rightAnchor.constraint(equalTo: colorView.rightAnchor, constant: 4),
            
            buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            buttonView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: buttonView.frame.height),
            buttonView.widthAnchor.constraint(equalToConstant: buttonView.frame.width),
            
            selectLabel.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            selectLabel.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor)
        ])
    }
}
