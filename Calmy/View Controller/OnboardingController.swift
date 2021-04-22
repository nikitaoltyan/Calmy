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
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.isScrollEnabled = false
        collection.isPagingEnabled = false
        collection.backgroundColor = .clear
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(OnboardingCellOne.self, forCellWithReuseIdentifier: "OnboardingCellOne")
        collection.register(OnboardingCellTwo.self, forCellWithReuseIdentifier: "OnboardingCellTwo")
        collection.register(OnboardingCellThree.self, forCellWithReuseIdentifier: "OnboardingCellThree")
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.pink
        SetSubviews()
        ActivateLayouts()
    }

}





extension OnboardingController: OnboardingDelegate{
    func NextSlide(slide: Int) {
        collection.isPagingEnabled = false
        let indexPath = IndexPath(item: slide, section: 0)
        collection.scrollToItem(at: indexPath, at: .right, animated: true)
        collection.isPagingEnabled = true
        collection.reloadItems(at: [IndexPath(item: slide, section: 0)])
    }
    
    func Finish() {
        Vibration.Medium()
        Defaults.setHasLaunched(statusToSet: true)
        let newVC = ViewController()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: true, completion: nil)
    }
}





extension OnboardingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MainConstants.screenWidth, height: MainConstants.screenHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "OnboardingCellOne", for: indexPath) as! OnboardingCellOne
            cell.delegate = self
            return cell
        case 2:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "OnboardingCellThree", for: indexPath) as! OnboardingCellThree
            cell.delegate = self
            return cell
        default:
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "OnboardingCellTwo", for: indexPath) as! OnboardingCellTwo
            cell.delegate = self
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





protocol OnboardingDelegate {
    func NextSlide(slide: Int)
    func Finish()
}
