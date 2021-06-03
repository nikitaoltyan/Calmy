//
//  Functions.swift
//  Calmy
//
//  Created by Nikita Oltyan on 30.04.2021.
//

import Foundation
import UIKit

class Functions {
    
    /// - returns: Bool value if person feels good in that day (average color is higher that given).
    static func checkMoodCondition(colors: [String]?, proportions: [Double]?, day: Date) -> Bool {
        guard let colors = colors else { return true }
        guard let proportions = proportions else { return true }
        
        var cum: CGFloat = 0
        for (i, color) in colors.enumerated() {
            let useColor = UIColor(named: color) ?? UIColor.white
            let (red, green, blue, _) = useColor.rgba
            cum += mean([red, green, blue]) * CGFloat(proportions[i])
        }

        let condition: Bool = cum < 0.22
//        Think about the cum number "under" that user could worry
        return condition
    }
    
    // Too big! Chould be redeveloped.
    /// in %
    static func calculateThreeMostUsed() -> Array<(String, Double)> {
        let data = DataFunction.fetchAllData()
        guard (data.count != 0) else { return [] }
        
        var result: Array<(String, Double)> = []
        var dict: [String:Double] = [:]
        var sum: Double = 0
        
        for row in 0...data.count-1 {
            let colors = data[row].colors
            let proportions = data[row].proportions
            let colorsCount = colors?.count ?? 1
            for item in 0...colorsCount-1 {
                let name = colors?[item] ?? "white"
                let check = dict[name]
                if (check != nil) {
                    dict[name]! += proportions?[item] ?? 0
                } else {
                    dict[name] = proportions?[item] ?? 0
                }
                sum += proportions?[item] ?? 0
            }
        }
        // Here we have dict with [ColorName: ItsDuration] and sum of all durations.
        
        let lenth: Int = {if dict.count > 3 {return 3} else {return dict.count} }()
        for _ in 0...lenth-1 {
            let m = dict.max { a, b in a.value < b.value }
            guard let max = m else { return []}
            dict.removeValue(forKey: max.key)
            result.append((max.key, max.value/sum))
        }
        return result
    }
    
//    Rewrite as Array extension.
    /// - warning: Only for [CGFloat]
    static func mean(_ array: [CGFloat]) -> CGFloat {
        guard (array.count != 0) else { return 0 }
        let sum = array.reduce(0, +)
        return sum / CGFloat(array.count)
    }
}
