//
//  BlockOne+MainButton.swift
//  Calmy
//
//  Created by Никита Олтян on 13.04.2021.
//

import UIKit

class BlockOne: UIView {
    
    let label: UILabel = {
        let label = UILabel()
            .with(color: Colors.nearBlack)
            .with(alignment: .left)
            .with(numberOfLines: 0)
            .with(fontName: "Helvetica-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("block_one_label", comment: "")
        return label
    }()
    
//    Rebuild that view into one View class for easier usage.
    let view: UIView = {
        let width: CGFloat = 100
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
            .with(bgColor: .clear)
            .with(cornerRadius: width/2)
            .with(bgColor: Colors.pink)
        view.addSoftUIEffectForView(cornerRadius: width/2, themeColor: Colors.pink)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        image.image = UIImage(named: "Ohm")
        image.tintColor = Colors.shadow
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        SetSubviews()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func animate() {
        label.center.x -= 350
        view.center.x += 350
        UIView.animate(withDuration: 0.5, animations: {
            self.label.center.x += 350
            self.view.center.x -= 350
        })
    }

}






extension BlockOne {
    func SetSubviews(){
        self.addSubview(label)
        self.addSubview(view)
        view.addSubview(buttonImage)
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35),
            
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            view.widthAnchor.constraint(equalToConstant: view.frame.width),
            view.heightAnchor.constraint(equalToConstant: view.frame.height),
            
            buttonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -2),
            buttonImage.heightAnchor.constraint(equalToConstant: buttonImage.frame.height),
            buttonImage.widthAnchor.constraint(equalToConstant: buttonImage.frame.width),
        ])
    }
}
