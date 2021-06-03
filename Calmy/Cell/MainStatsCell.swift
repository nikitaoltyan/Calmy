//
//  MainStatsCell.swift
//  Calmy
//
//  Created by Никита Олтян on 04.05.2021.
//

import UIKit

class MainStatsCell: UITableViewCell {
    
    let firstView: UIView = {
        let width: CGFloat = 190
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
            .with(bgColor: .red)
            .with(cornerRadius: width/2)
            .with(autolayout: false)
            .withShadow(size: CGSize(width: 1, height: 1))
        view.isHidden = true
        view.isUserInteractionEnabled = true
        return view
    }()

    let secondView: UIView = {
        let width: CGFloat = 150
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
            .with(bgColor: .blue)
            .with(cornerRadius: width/2)
            .with(autolayout: false)
            .withShadow(size: CGSize(width: 1, height: 1))
        view.isHidden = true
        return view
    }()
    
    let thirdView: UIView = {
        let width: CGFloat = 130
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
            .with(bgColor: .orange)
            .with(cornerRadius: width/2)
            .with(autolayout: false)
            .withShadow(size: CGSize(width: 1, height: 1))
        view.isHidden = true
        return view
    }()
    
    let firstLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.pink)
            .with(alignment: .center)
            .with(fontName: "Helvetica-Bold", size: 46)
            .with(autolayout: false)
        label.isHidden = true
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.pink)
            .with(alignment: .center)
            .with(fontName: "Helvetica-Bold", size: 44)
            .with(autolayout: false)
        label.isHidden = true
        return label
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
            .with(color: Colors.pink)
            .with(alignment: .center)
            .with(fontName: "Helvetica-Bold", size: 42)
            .with(autolayout: false)
        label.isHidden = true
        return label
    }()
    
    lazy var views: Array<UIView> = [firstView, secondView, thirdView]
    lazy var labels: Array<UILabel> = [firstLabel, secondLabel, thirdLabel]
    var percent: Array<Int> = []
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Colors.pink
        setupColors()
        
        setSubviews()
        activateLayouts()
        animate()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupColors(){
        let mostUsed = Functions.calculateThreeMostUsed()
        for (item, data) in mostUsed.enumerated(){
            let (colorName, percentage) = data
            views[item].isHidden = false
            views[item].backgroundColor = UIColor(named: colorName)
            percent.append(Int(round(percentage*100)))
        }
    }

    func animate(){
        UIView.animate(withDuration: 0.6, animations: {
            self.firstView.center = CGPoint(x: 100, y: 420)
            self.secondView.center = CGPoint(x: 300, y: 150)
            self.thirdView.center = CGPoint(x: -300, y: 400)
        }, completion: { (_) in
            for (i, pc) in self.percent.enumerated() {
                self.labels[i].isHidden = false
                self.labels[i].text = "\(pc)%"
            }
            self.staticAnimation()
        })
    }
    
    
    func staticAnimation(){
        for (i, view) in views.enumerated() {
            let xCoef = CGFloat.random(in: 1...1.2)
            let yCoef = CGFloat.random(in: 1...1.2)
            UIView.animate(withDuration: 8, animations: {
                view.transform = CGAffineTransform(scaleX: xCoef, y: yCoef)
            }, completion: { (_) in
                UIView.animate(withDuration: 8, animations: {
                    view.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: { (_) in
                    if (i == self.views.count-1) { self.staticAnimation() }
                })
            })
        }
    }

}






extension MainStatsCell {
    func setSubviews(){
        self.addSubview(firstView)
        self.addSubview(secondView)
        self.addSubview(thirdView)
        self.addSubview(firstLabel)
        self.addSubview(secondLabel)
        self.addSubview(thirdLabel)
    }
    
    func activateLayouts(){
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            firstView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            firstView.widthAnchor.constraint(equalToConstant: firstView.frame.width),
            firstView.heightAnchor.constraint(equalToConstant: firstView.frame.height),
            
            secondView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25),
            secondView.topAnchor.constraint(equalTo: firstView.centerYAnchor, constant: 90),
            secondView.widthAnchor.constraint(equalToConstant: secondView.frame.width),
            secondView.heightAnchor.constraint(equalToConstant: secondView.frame.height),
            
            thirdView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
            thirdView.topAnchor.constraint(equalTo: secondView.centerYAnchor, constant: -30),
            thirdView.widthAnchor.constraint(equalToConstant: thirdView.frame.width),
            thirdView.heightAnchor.constraint(equalToConstant: thirdView.frame.height),
            
            firstLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            firstLabel.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
            
            secondLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            secondLabel.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
            
            thirdLabel.centerXAnchor.constraint(equalTo: thirdView.centerXAnchor),
            thirdLabel.centerYAnchor.constraint(equalTo: thirdView.centerYAnchor),
        ])
    }
}

