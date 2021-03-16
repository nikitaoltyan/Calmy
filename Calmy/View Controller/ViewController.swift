//
//  ViewController.swift
//  Moody
//
//  Created by Никита Олтян on 25.02.2021.
//

import UIKit
import MHSoftUI
import CoreData

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        view.backgroundColor = Colors.pink
        view.addSoftUIEffectForView(cornerRadius: 150/2, themeColor: Colors.pink)
        view.layer.cornerRadius = 150/2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        image.image = UIImage(named: "Ohm")
        image.tintColor = Colors.shadow
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var colorTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = Colors.pink
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.separatorColor = .clear
        table.register(ColorDayCell.self, forCellReuseIdentifier: "ColorDayCell")
        return table
    }()
    
    lazy var addColorView: AddColorView = {
        let view = AddColorView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth, height: 650))
            .with(cornerRadius: 15)
            .with(bgColor: Colors.pink)
        view.delegate = self
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let dimView: UIView = {
        let view = UIView()
            .with(bgColor: UIColor.black.withAlphaComponent(0))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var model: [Model]?
    
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(FetchData), name: UIApplication.willEnterForegroundNotification, object: nil)
        view.backgroundColor = Colors.pink
        SetSubviews()
        ActivateLayouts()
        FetchData()
    }
    
    
    
    @objc func FetchData(){
        model = DataFunction.FetchData()
        colorTable.reloadData()
    }
    
    
    @objc func ShowAddColorView(){
        Vibration.Light()
        addColorView.center.y = MainConstants.screenHeight + addColorView.frame.height/2
        addColorView.isHidden = false
        dimView.isHidden = false
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.backgroundColor = self.dimView.backgroundColor?.withAlphaComponent(0.45)
            self.addColorView.center.y -= self.addColorView.frame.height
        }, completion: { finished in
            print("Animation completed")
        })
    }
    
    
    @objc func HideAddColorView(){
        Vibration.Light()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.addColorView.center.y += self.addColorView.frame.height
            self.dimView.backgroundColor = self.dimView.backgroundColor?.withAlphaComponent(0)
        }, completion: { finished in
            self.dimView.isHidden = true
            self.addColorView.isHidden = true
        })
    }
}






extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTable.dequeueReusableCell(withIdentifier: "ColorDayCell", for: indexPath) as! ColorDayCell
        cell.UpdateColorView(proportions: model?[indexPath.row].proportions,
                             colors: model?[indexPath.row].colors)
        return cell
    }
}





extension ViewController: AddColorViewProtocol {
    func CloseView() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.backgroundColor = self.dimView.backgroundColor?.withAlphaComponent(0)
        }, completion: { finished in
            self.dimView.isHidden = true
        })
        addColorView.isHidden = true
    }
    
    func AddData(proportion: Double, color: String, forDate date: String) {
        DataFunction.Add(proportion: proportion, color: color, date: date)
        DispatchQueue.main.async{ self.FetchData() }
    }
}







extension ViewController {
    func SetSubviews(){
        view.addSubview(mainView)
        view.addSubview(colorTable)
        view.addSubview(dimView)
        view.addSubview(addColorView)
        mainView.addSubview(buttonImage)
        
        mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ShowAddColorView)))
        dimView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HideAddColorView)))
        
        dimView.isHidden = true
    }
    
    func ActivateLayouts(){
        NSLayoutConstraint.activate([
            colorTable.topAnchor.constraint(equalTo: view.topAnchor),
            colorTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            colorTable.rightAnchor.constraint(equalTo: view.rightAnchor),
            colorTable.heightAnchor.constraint(equalToConstant: 500),
            
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.heightAnchor.constraint(equalToConstant: mainView.frame.height),
            mainView.widthAnchor.constraint(equalToConstant: mainView.frame.width),
            
            buttonImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            buttonImage.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: -3),
            buttonImage.heightAnchor.constraint(equalToConstant: buttonImage.frame.height),
            buttonImage.widthAnchor.constraint(equalToConstant: buttonImage.frame.width),
            
            addColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            addColorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addColorView.heightAnchor.constraint(equalToConstant: addColorView.frame.height),
            addColorView.widthAnchor.constraint(equalToConstant: addColorView.frame.width),
            
            dimView.topAnchor.constraint(equalTo: view.topAnchor),
            dimView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dimView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}





protocol SetColorCellProtocol {
    func CloseView()
    func AddData(proportion: Double, color: String, forDate date: String)
}

protocol AddColorViewProtocol {
    func CloseView()
    func AddData(proportion: Double, color: String, forDate date: String)
}
