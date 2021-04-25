//
//  QuickAddView.swift
//  Calmy
//
//  Created by Nikita Oltyan on 22.04.2021.
//

import UIKit

class QuickAddView: UIView {
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumLineSpacing = 10
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        collection.register(QuickAddCell.self, forCellWithReuseIdentifier: "QuickAddCell")
        return collection
    }()
    
    let colors: Array<String> = ColorsData.colorsAssetsNames
    var delegate: SetColorCellProtocol?
    

    override init(frame: CGRect){
        super.init(frame: frame)
        SetSubviews()
        ActivateLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}



extension QuickAddView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let condition: Bool = MainConstants.screenHeight > 700
        if (condition) {
            return CGSize(width: collection.frame.width/2-10, height: 95)
        } else {
            return CGSize(width: collection.frame.width/2-10, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "QuickAddCell", for: indexPath) as! QuickAddCell
        cell.view.backgroundColor = UIColor(named: colors[indexPath.row])
        cell.color = colors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collection.cellForItem(at: indexPath) as? QuickAddCell {
            delegate?.CloseView()
            delegate?.AddData(proportion: Double(TimeFunctions.GetTime()), color: cell.color!, forDate: Date().onlyDate)
        }
    }
}




extension QuickAddView {
    func SetSubviews(){
        self.addSubview(collection)
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.topAnchor),
            collection.leftAnchor.constraint(equalTo: self.leftAnchor),
            collection.rightAnchor.constraint(equalTo: self.rightAnchor),
            collection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
