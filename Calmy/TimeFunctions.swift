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
    static func GetTime() -> CGFloat{
        let date = Date()
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return CGFloat(hours*60 + minutes)/1440
    }
}
