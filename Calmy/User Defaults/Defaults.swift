//
//  Defaults.swift
//  Calmy
//
//  Created by Никита Олтян on 01.04.2021.
//

import Foundation

class Defaults {
    
    static let userDefaults = UserDefaults.standard
    
    
    /// Set "has launched" indicator.
    static func setHasLaunched(statusToSet: Bool) {
        userDefaults.setValue(statusToSet, forKey: "hasLaunched")
    }
    
    /// Set " default Color Table" indicator for AddColorView.
    static func setDefaultColorTable(statusToSet: Int) {
        userDefaults.setValue(statusToSet, forKey: "defaultColorTable")
    }
    
    /// Get " defaultColorTable" indicator for activiting right table in AddColorView.
    static func getDefaultColorTable() -> Int {
        return userDefaults.integer(forKey: "defaultColorTable")
    }
}
