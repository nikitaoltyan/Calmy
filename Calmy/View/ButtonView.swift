//
//  ButtonView.swift
//  Calmy
//
//  Created by Nikita Oltyan on 09.04.2021.
//

import UIKit

class ButtonView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.pink
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 25.0)
        return label
    }()
    
    var isActive: Bool = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.shadow
        SetSubviews()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}





extension ButtonView {
    
    func SetSubviews(){
        self.addSubview(label)
    }
    
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
