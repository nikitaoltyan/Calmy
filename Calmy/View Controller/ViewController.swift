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
        let size: CGFloat = {
            if MainConstants.screenHeight == 736 {return 100}
            else if MainConstants.screenHeight > 700 {return 150}
            else {return 100}}()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        view.backgroundColor = Colors.pink
        view.addSoftUIEffectForView(cornerRadius: size/2, themeColor: Colors.pink)
        view.layer.cornerRadius = size/2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonImage: UIImageView = {
        let size: CGFloat = {
            if MainConstants.screenHeight == 736 {return 65}
            else if MainConstants.screenHeight > 700 {return 100}
            else {return 60}}()
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        image.image = UIImage(named: "Ohm")
        image.tintColor = Colors.shadow
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var colorTable: UITableView = {
        let table = UITableView()
            .with(bgColor: Colors.pink)
            .with(autolayout: false)
        
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.separatorColor = .clear
        table.register(ColorDayCell.self, forCellReuseIdentifier: "ColorDayCell")
        return table
    }()
    
    lazy var addColorView: AddColorView = {
        let height: CGFloat = {
            if MainConstants.screenHeight == 736 {return 600}
            else if MainConstants.screenHeight > 700 {return 650}
            else {return 540}}()
        let view = AddColorView(frame: CGRect(x: 0, y: 0, width: MainConstants.screenWidth, height: height))
            .with(cornerRadius: 15)
            .with(bgColor: Colors.pink)
        view.delegate = self
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let statsImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
            .with(autolayout: false)
        view.image = UIImage(systemName: "rectangle.3.offgrid.fill")
        view.tintColor = Colors.shadow
        view.isUserInteractionEnabled = true
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
        NotificationCenter.default.addObserver(self, selector: #selector(fetchData), name: UIApplication.willEnterForegroundNotification, object: nil)
        view.backgroundColor = Colors.pink
        SetSubviews()
        ActivateLayouts()
        fetchData()
    }
    
    
    
    @objc func fetchData(){
        model = DataFunction.FetchData()
        colorTable.reloadData()
        statsImage.isHidden = !(DataFunction.checkIfCount(moreThen: 1))
    }
    
    
    @objc
    func ShowAddColorView(){
        Vibration.light()
        addColorView.center.y = MainConstants.screenHeight + addColorView.frame.height/2
        addColorView.isHidden = false
        dimView.isHidden = false
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.backgroundColor = self.dimView.backgroundColor?.withAlphaComponent(0.45)
            self.addColorView.center.y -= self.addColorView.frame.height
        }, completion: { finished in
            print("Animation completed")
        })
    }
    
    
    @objc
    func hideAddColorView(){
        Vibration.light()
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.addColorView.center.y += self.addColorView.frame.height
            self.dimView.backgroundColor = self.dimView.backgroundColor?.withAlphaComponent(0)
        }, completion: { finished in
            self.dimView.isHidden = true
            self.addColorView.isHidden = true
        })
    }
    
    
    @objc
    func openStats(){
        let newVC = StatsController()
        newVC.modalPresentationStyle = .overFullScreen
        customPresent(newVC, from: .fromLeft, withDuration: 0.18)
    }
    
    
    func openInst(){
        let instagramHooks = "instagram://user?username=calmy_en"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            print("Open Calmy Inst page")
            UIApplication.shared.open(instagramUrl! as URL, options: [:], completionHandler: nil)
        } else {
            print("Open Ordinary Inst page")
            UIApplication.shared.open(NSURL(string: "http://instagram.com/")! as URL, options: [:], completionHandler: nil)
        }
    }
}






extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if MainConstants.screenHeight > 700 {
            return 55
        } else {
            return 38
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTable.dequeueReusableCell(withIdentifier: "ColorDayCell", for: indexPath) as! ColorDayCell
        cell.updateColorView(proportions: model?[indexPath.row].proportions,
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
        AppStoreReviewManager.requestReview()
    }
    
    func AddData(proportion: Double, color: String, forDate date: Date?) {
        DispatchQueue.main.async{
            DataFunction.Add(proportion: proportion, color: color, date: date)
            self.fetchData()
        }
    }
    
    func ShowAlert() {
        var alert = prepareAlert(withTitle: NSLocalizedString("info", comment: ""),
                                 andSubtitle: NSLocalizedString("info_desc", comment: ""))
        alert.addAction(UIAlertAction(title: "Instagram", style: .default , handler:{ (UIAlertAction) in
            self.openInst()
        }))

        alert.addAction(UIAlertAction(title: "Privacy Policy", style: .default , handler:{ (UIAlertAction) in
            if let url = URL(string: "http://calmy.tilda.ws/privacy_policy") { UIApplication.shared.open(url) }
        }))
        alert = alert.removeBreakingConstraints
        present(alert, animated: true, completion: nil)
    }
}







extension ViewController {
    func SetSubviews(){
        view.addSubview(mainView)
        view.addSubview(colorTable)
        view.addSubview(statsImage)
        view.addSubview(dimView)
        view.addSubview(addColorView)
        mainView.addSubview(buttonImage)
        
        mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ShowAddColorView)))
        dimView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideAddColorView)))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hideAddColorView))
        swipeDown.direction = .down
        addColorView.addGestureRecognizer(swipeDown)
        statsImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openStats)))
        
        dimView.isHidden = true
    }
    
    func ActivateLayouts(){
        let colorTableHeight: CGFloat = {if MainConstants.screenHeight > 700 {return 500} else {return 320}}()
        let buttonBottom: CGFloat = {
            if MainConstants.screenHeight == 736 {return -70}
            else if MainConstants.screenHeight > 700 {return -100}
            else {return -50}}()
        NSLayoutConstraint.activate([
            colorTable.topAnchor.constraint(equalTo: view.topAnchor),
            colorTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            colorTable.rightAnchor.constraint(equalTo: view.rightAnchor),
            colorTable.heightAnchor.constraint(equalToConstant: colorTableHeight),
            
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: buttonBottom),
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.heightAnchor.constraint(equalToConstant: mainView.frame.height),
            mainView.widthAnchor.constraint(equalToConstant: mainView.frame.width),
            
            statsImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            statsImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            statsImage.heightAnchor.constraint(equalToConstant: statsImage.frame.height),
            statsImage.widthAnchor.constraint(equalToConstant: statsImage.frame.width),
            
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
    func AddData(proportion: Double, color: String, forDate date: Date?)
}

protocol AddColorViewProtocol {
    func CloseView()
    func AddData(proportion: Double, color: String, forDate date: Date?)
    func ShowAlert()
}
