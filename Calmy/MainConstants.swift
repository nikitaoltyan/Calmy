//
//  MainConstants.swift
//  Moody
//
//  Created by Nikita Oltyan on 27.02.2021.
//

import Foundation
import UIKit


class Colors {

    static let pink = UIColor(red: 250/255, green: 225/255, blue: 221/255, alpha: 1)
    static let shadow = UIColor(red: 233/255, green: 130/255, blue: 114/255, alpha: 1)
    static let logoColor = UIColor(red: 43/255, green: 28/255, blue: 41/255, alpha: 1)
    static let nearBlack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
    
}




class MainConstants {
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
}




class Vibration {
    
    static func Soft() -> Void{
        let soft = UIImpactFeedbackGenerator(style: .soft)
        soft.impactOccurred()
    }
    
    static func Light() -> Void{
        let light = UIImpactFeedbackGenerator(style: .light)
        light.impactOccurred()
    }
    
    static func Medium() -> Void{
        let medium = UIImpactFeedbackGenerator(style: .medium)
        medium.impactOccurred()
    }
    
    static func Heavy() -> Void{
        let heavy = UIImpactFeedbackGenerator(style: .heavy)
        heavy.impactOccurred()
    }
}

// Access Token Github: 35de02dcdd611aa154bf75fe929cf047a770a9d3
