//
//  TimeFunctions.swift
//  Calmy
//
//  Created by Никита Олтян on 28.02.2021.
//

import Foundation
import UIKit


class TimeFunctions {
    
    /// - returns: Proportion of passed minutes in this day per all minutes in day.
    /// - warning: Rounded to 3 decimal digits (0.001298 -> 0.001 for example)
    static func GetTime() -> CGFloat{
        let date = Date()
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let ret = CGFloat(hours*60 + minutes)/1440
        return CGFloat(round(1000*ret)/1000)
    }
}
