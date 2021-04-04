//
//  OnboardingController.swift
//  Calmy
//
//  Created by Никита Олтян on 01.04.2021.
//

import UIKit

class OnboardingController: UIViewController {

    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.backgroundColor = .clear
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(OnboardingCellOne.self, forCellWithReuseIdentifier: "OnboardingCellOne")
        collection.register(OnboardingCellTwo.self, forCellWithReuseIdentifier: "OnboardingCellTwo")
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.pink
        SetSubviews()
        ActivateLayouts()
    }


}






extension OnboardingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MainConstants.screenWidth, height: MainConstants.screenHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "OnboardingCellOne", for: indexPath) as! OnboardingCellOne
            return cell
        default:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "OnboardingCellTwo", for: indexPath) as! OnboardingCellTwo
            cell.largeLabel.text = "Welcome to the Mood-tracker app"
            return cell
        }
    }
}






extension OnboardingController{
    func SetSubviews() {
        view.addSubview(collection)
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.leftAnchor.constraint(equalTo: view.leftAnchor),
            collection.rightAnchor.constraint(equalTo: view.rightAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
