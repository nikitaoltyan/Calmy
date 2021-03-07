//
//  Date Extension.swift
//  Calmy
//
//  Created by Никита Олтян on 06.03.2021.
//

import Foundation
import UIKit

extension Date {

    /// Returns the day of a month of the current Date.
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    
    /// Returns the text month of the current Date.
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    
    /// Returns the year of the current Date.
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
    
    func onlyDate() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }

}
