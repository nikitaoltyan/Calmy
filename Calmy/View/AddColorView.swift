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
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 40), collectionViewLayout: layout)
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
    
    lazy var quickAddView: QuickAddView = {
        let view = QuickAddView(frame: CGRect(x: 0, y: 0,
                                              width: collection.frame.width-20,
                                              height: collection.frame.height-20))
            .with(bgColor: .clear)
            .with(autolayout: false)
        view.delegate = self
        return view
    }()
    
    let closeView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 6))
            .with(bgColor: Colors.shadow)
            .with(cornerRadius: 3)
            .with(autolayout: false)
        return view
    }()
    
    let infoImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
            .with(autolayout: false)
        view.image = UIImage(systemName: "questionmark.circle")
        view.tintColor = Colors.shadow
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let changeAddWay: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
            .with(autolayout: false)
        view.image = UIImage(systemName: "square.grid.2x2.fill")
        view.tintColor = Colors.shadow
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    var delegate: AddColorViewProtocol?
    let colors: Array<String> = ColorsData.colorsAssetsNames
    let colorsNames: Array<String> = ColorsData.colorsNames
    let colorsDesc: Array<String> = ColorsData.colorsDesc
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        switch Defaults.getDefaultColorTable() {
        case 0:
            quickAddView.isHidden = true
        default:
            collection.isHidden = true
        }
        SetSubviews()
        ActivateLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    @objc func Info(){
        print("Info")
        delegate?.ShowAlert()
    }
    
    @objc func ChangeView() {
        if (collection.isHidden) {
            collection.isHidden = false
            quickAddView.isHidden = true
            Defaults.setDefaultColorTable(statusToSet: 0)
        } else {
            collection.isHidden = true
            quickAddView.isHidden = false
            Defaults.setDefaultColorTable(statusToSet: 1)
        }
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
        cell.colorLabel.text = colorsNames[indexPath.row]
        cell.desc.text = colorsDesc[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    
}





extension AddColorView: SetColorCellProtocol {
    func CloseView() {
        delegate?.CloseView()
    }
    
    func AddData(proportion: Double, color: String, forDate date: Date?) {
        delegate?.AddData(proportion: proportion, color: color, forDate: date)
    }
}






extension AddColorView {
    
    func SetSubviews(){
        self.addSubview(collection)
        self.addSubview(quickAddView)
        self.addSubview(infoImage)
        self.addSubview(changeAddWay)
        self.addSubview(closeView)
        
        infoImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Info)))
        changeAddWay.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ChangeView)))
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collection.widthAnchor.constraint(equalToConstant: collection.frame.width),
            collection.heightAnchor.constraint(equalToConstant: collection.frame.height),
            
            quickAddView.topAnchor.constraint(equalTo: self.topAnchor, constant: 45),
            quickAddView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            quickAddView.widthAnchor.constraint(equalToConstant: quickAddView.frame.width),
            quickAddView.heightAnchor.constraint(equalToConstant: quickAddView.frame.height),
            
            infoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            infoImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            infoImage.heightAnchor.constraint(equalToConstant: infoImage.frame.height),
            infoImage.widthAnchor.constraint(equalToConstant: infoImage.frame.width),
            
            changeAddWay.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            changeAddWay.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            changeAddWay.heightAnchor.constraint(equalToConstant: changeAddWay.frame.height),
            changeAddWay.widthAnchor.constraint(equalToConstant: changeAddWay.frame.width),
            
            closeView.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            closeView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            closeView.widthAnchor.constraint(equalToConstant: closeView.frame.width),
            closeView.heightAnchor.constraint(equalToConstant: closeView.frame.height),
        ])
    }
}
