//
//  MainConstants.swift
//  Moody
//
//  Created by Никита Олтян on 27.02.2021.
//

import Foundation
import UIKit


class Colors {

    static let pink = UIColor(red: 250/255, green: 225/255, blue: 221/255, alpha: 1)
    static let shadow = UIColor(red: 233/255, green: 130/255, blue: 114/255, alpha: 1)
    
}




class MainConstants {
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
}




class ChoosableColors {
    
    static let charcoal = UIColor(red: 38/255, green: 70/255, blue: 83/255, alpha: 1)
    static let persianGreen = UIColor(red: 42/255, green: 157/255, blue: 143/255, alpha: 1)
    static let orangeYellowCrayola = UIColor(red: 233/255, green: 196/255, blue: 106/255, alpha: 1)
    static let sandyBrown = UIColor(red: 244/255, green: 162/255, blue: 97/255, alpha: 1)
    static let burntSienna = UIColor(red: 231/255, green: 111/255, blue: 81/255, alpha: 1)
    
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
