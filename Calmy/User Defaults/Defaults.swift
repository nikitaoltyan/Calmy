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
    static func SetHasLaunched(statusToSet: Bool) {
        userDefaults.setValue(statusToSet, forKey: "hasLaunched")
    }
}
