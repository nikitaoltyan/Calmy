//
//  DataFunctions.swift
//  Calmy
//
//  Created by Никита Олтян on 04.03.2021.
//

import Foundation
import UIKit
import CoreData

class DataFunction {
    
    static let appDelegate = UIApplication.shared.delegate as? AppDelegate
    static let managedContext = appDelegate!.persistentContainer.viewContext
    static let request: NSFetchRequest<Model> = Model.fetchRequest()
    
    /// Returns all data in model.
    /// - warning: Only for "Model" Data Model.
    /// - warning: Recreate fetch request for properly fetching updated data.
    static func FetchData() -> [Model]{
        let request: NSFetchRequest<Model> = Model.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            return try managedContext.fetch(request)
        } catch {
            print(error)
        }
        return []
    }
    
    
    /// Add give data in model.
    /// - warning: Only for "Model" Data Model.
    static func AddDataToModel(proportions: [Double], colors: [String], date: Date?){
        guard (date != nil) else { return }
        guard (proportions.count > 0) else { return }
        guard (colors.count > 0) else { return }
        let newStamp = Model(context: managedContext)
        newStamp.proportions = proportions
        newStamp.colors = colors
        newStamp.day = date
        try! managedContext.save()
    }
    
    
    /// Function for deleteing all data in model
    /// - warning: Only for "Model" Data Model.
    static func DeleteAll(){
        for item in FetchData() {
            managedContext.delete(item)
        }
        try! managedContext.save()
    }
    
    
    static func GetByDay(date: Date) -> [Model]{
        request.predicate = NSPredicate(format: "day = %@", argumentArray: [date])
        request.returnsObjectsAsFaults = false
        do {
            return try managedContext.fetch(request)
        } catch {
            print(error)
        }
        return []
    }
    

    static func ChangeDataForDay(date: Date, proportions: [Double]?, colors: [String]?){
        guard (proportions != nil) else { return }
        guard (colors != nil) else { return }
        request.predicate = NSPredicate(format: "day = %@", argumentArray: [date])
        request.returnsObjectsAsFaults = false
        do {
            let data = try managedContext.fetch(request)
            data[0].setValue(colors, forKey: "colors")
            data[0].setValue(proportions, forKey: "proportions")
            try! managedContext.save()
        } catch {
            print(error)
        }
    }
    
    
    static func Add(proportion: Double, color: String, date: Date?) {
        guard (date != nil) else { return }
        let data = GetByDay(date: date!)
        if data.count == 1 {
            var prop = data[0].proportions
            var colors = data[0].colors
            if prop?.count == 0 {
                prop?.append(proportion)
            } else {
                let sum = prop?.reduce(0, +)
                prop?.append(proportion - sum!)
            }
            colors?.append(color)
            ChangeDataForDay(date: date!, proportions: prop, colors: colors)
        } else {
            CloseDay(color: color)
            AddDataToModel(proportions: [proportion], colors: [color], date: date)
        }
    }
    
    
    private static func CloseDay(color: String) {
        let data = FetchData()
        guard (data.count > 0) else { return }
        var prop = data[data.count-1].proportions
        var colors = data[data.count-1].colors
        if prop?.count == 0 {
            prop?.append(1)
        } else {
            let sum = prop?.reduce(0, +)
            prop?.append(1 - sum!)
        }
        colors?.append(color)
        data[data.count-1].setValue(colors, forKey: "colors")
        data[data.count-1].setValue(prop, forKey: "proportions")
        try! managedContext.save()
    }
}
