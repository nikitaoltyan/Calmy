//
//  AddColorView.swift
//  Calmy
//
//  Created by Никита Олтян on 04.03.2021.
//

import UIKit

class AddColorView: UIView {

    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumLineSpacing = 5
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        
        collection.backgroundColor = Colors.pink
        collection.delegate = self
        collection.dataSource = self
        collection.register(SetColorCell.self, forCellWithReuseIdentifier: "SetColorCell")
        return collection
    }()
    
    var delegate: AddColorViewProtocol?
    let colors: Array<String> = ["black",
                                "charcoal",
                                "persianGreen",
                                "orangeYellowCrayola",
                                "sandyBrown",
                                "burntSienna",]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SetSubviews()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}





extension AddColorView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MainConstants.screenWidth*3/4, height: self.frame.height-75)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "SetColorCell", for: indexPath) as! SetColorCell
        cell.colorView.backgroundColor = UIColor(named: colors[indexPath.row])
        cell.color = colors[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    
}





extension AddColorView: SetColorCellProtocol {
    func CloseView() {
        delegate?.CloseView()
    }
    
    func AddData(proportion: Double, color: String, forDate date: String) {
        delegate?.AddData(proportion: proportion, color: color, forDate: date)
    }
}






extension AddColorView {
    
    func SetSubviews(){
        self.addSubview(collection)
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            collection.leftAnchor.constraint(equalTo: self.leftAnchor),
            collection.rightAnchor.constraint(equalTo: self.rightAnchor),
            collection.heightAnchor.constraint(equalToConstant: self.frame.height - 40)
        ])
    }
}
