//
//  StatsController.swift
//  Calmy
//
//  Created by Никита Олтян on 30.04.2021.
//

import UIKit

class StatsController: UIViewController {

    lazy var table: UITableView = {
        let table = UITableView()
            .with(bgColor: Colors.pink)
            .with(autolayout: false)
        
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.separatorColor = .clear
        table.register(HorizontalDayCell.self, forCellReuseIdentifier: "HorizontalDayCell")
        return table
    }()
    
    var model: [Model]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        activateLayouts()
        fetchData()
    }

    
    @objc func fetchData(){
        model = DataFunction.fetchAllData()
        table.reloadData()
    }
}



extension StatsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "HorizontalDayCell", for: indexPath) as! HorizontalDayCell
        cell.update(proportions: model?[indexPath.row].proportions,
                    colors: model?[indexPath.row].colors,
                    day: Date().onlyDate)
        return cell
    }
}





extension StatsController {
    func setSubviews(){
        view.addSubview(table)
    }
    
    func activateLayouts(){
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leftAnchor.constraint(equalTo: view.leftAnchor),
            table.rightAnchor.constraint(equalTo: view.rightAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
