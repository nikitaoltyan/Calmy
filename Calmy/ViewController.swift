//
//  ViewController.swift
//  Moody
//
//  Created by Никита Олтян on 25.02.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        view.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 235/255, alpha: 1)
        view.layer.cornerRadius = 150/2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    
    override func viewDidLoad() {
        view.backgroundColor = Colors.pink
        SetSubviews()
        ActivateLayouts()
    }
}






extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTable.dequeueReusableCell(withIdentifier: "ColorDayCell", for: indexPath) as! ColorDayCell
        return cell
    }
}







extension ViewController {
    func SetSubviews(){
        view.addSubview(mainView)
        view.addSubview(colorTable)
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
            mainView.widthAnchor.constraint(equalToConstant: mainView.frame.width)
        ])
    }
}
