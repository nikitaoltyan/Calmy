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
        table.allowsSelection = false
        table.isUserInteractionEnabled = true
        table.separatorColor = .clear
        table.register(HorizontalDayCell.self, forCellReuseIdentifier: "HorizontalDayCell")
        table.register(MainStatsCell.self, forCellReuseIdentifier: "MainStatsCell")
        return table
    }()
    
    let mainViewImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
            .with(autolayout: false)
        view.image = UIImage(systemName: "circle.fill")
        view.tintColor = Colors.shadow
        view.isUserInteractionEnabled = true
        return view
    }()
    
//    lazy var statsModel: StatsControllerModel = {
//        let model = StatsControllerModel()
//        model.delegate = self
//        return model
//    }()
    
    var model: [Model]?
    var tableHeightConst: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        statsModel = .init()
        setSubviews()
        activateLayouts()
        fetchData()
    }
    

    
    @objc func fetchData(){
        model = DataFunction.fetchAllData()
        model?.reverse()
        table.reloadData()
    }
    
    @objc func close(){
        customDismiss(to: .fromRight, withDuration: 0.18)
    }
}


extension StatsController: HorizontalDayCellDelegate{
    @objc func warningAction() {
        var alert = prepareAlert(withTitle: NSLocalizedString("warning_title", comment: ""),
                                 andSubtitle: NSLocalizedString("warning_subtitle", comment: ""))
        alert.addAction(UIAlertAction(title: NSLocalizedString("warning_label", comment: ""), style: .default , handler:{ (UIAlertAction) in
            if let url = URL(string: NSLocalizedString("warning_link", comment: "")) { UIApplication.shared.open(url) }
        }))
        alert = alert.removeBreakingConstraints
        present(alert, animated: true, completion: nil)
    }
}





extension StatsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (model?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 400
        default: return 115
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = table.dequeueReusableCell(withIdentifier: "MainStatsCell", for: indexPath) as! MainStatsCell
            return cell
        default:
            let cell = table.dequeueReusableCell(withIdentifier: "HorizontalDayCell", for: indexPath) as! HorizontalDayCell
            cell.update(proportions: model?[indexPath.row-1].proportions,
                        colors: model?[indexPath.row-1].colors,
                        day: model?[indexPath.row-1].day)
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
    }
}





extension StatsController {
    func setSubviews(){
        view.addSubview(table)
        view.addSubview(mainViewImage)
        mainViewImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(close)))
    }
    
    func activateLayouts(){
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leftAnchor.constraint(equalTo: view.leftAnchor),
            table.rightAnchor.constraint(equalTo: view.rightAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainViewImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            mainViewImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            mainViewImage.widthAnchor.constraint(equalToConstant: mainViewImage.frame.width),
            mainViewImage.heightAnchor.constraint(equalToConstant: mainViewImage.frame.height)
        ])
    }
}
