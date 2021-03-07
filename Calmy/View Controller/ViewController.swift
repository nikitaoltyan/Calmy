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
    
    var model: [Model]?
    var proportionsExample: Array<Double> = []
    var colorsExample: Array<String> = []
    var date: String?
    
    
    override func viewDidLoad() {
        view.backgroundColor = Colors.pink
        SetSubviews()
        ActivateLayouts()
        model = DataFunction.FetchData()
    }
    
    
    @objc func ShowAddColorView(){
        addColorView.isHidden = false
        print(model)
        print("Proportions: \(proportionsExample)\nColors: \(colorsExample)\nDate: \(date)")
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
        print("For cell \(indexPath.row) data is: \(model?[indexPath.row])")
        return cell
    }
}





extension ViewController: AddColorViewProtocol {
    func CloseView() {
        addColorView.isHidden = true
    }
    
    func AddData(proportion: Double, color: String, forDate date: String) {
        if proportionsExample.count == 0 {
            proportionsExample.append(proportion)
        } else {
            let sum = proportionsExample.reduce(0, +)
            proportionsExample.append(proportion - sum)
        }
        colorsExample.append(color)
        self.date = date
        DataFunction.AddDataToModel(proportions: proportionsExample, colors: colorsExample, date: date)
    }
}







extension ViewController {
    func SetSubviews(){
        view.addSubview(mainView)
        view.addSubview(colorTable)
        view.addSubview(addColorView)
        mainView.addSubview(buttonImage)
        
        mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ShowAddColorView)))
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
