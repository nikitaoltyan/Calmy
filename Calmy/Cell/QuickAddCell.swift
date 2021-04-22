//
//  QuickAddCell.swift
//  Calmy
//
//  Created by Никита Олтян on 22.04.2021.
//

import UIKit

class QuickAddCell: UICollectionViewCell {
    
    let view: UIView = {
        let view = UIView()
            .with(bgColor: .clear)
            .with(cornerRadius: 10)
            .with(autolayout: false)
        return view
    }()
    
    var color: String?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        SetSubviews()
        ActivateLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}



extension QuickAddCell {
    func SetSubviews(){
        self.addSubview(view)
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leftAnchor.constraint(equalTo: self.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
