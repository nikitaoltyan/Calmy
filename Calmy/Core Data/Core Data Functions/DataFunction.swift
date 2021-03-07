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
    static func FetchData() -> [Model]{
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
    static func AddDataToModel(proportions: [Double], colors: [String], date: String?){
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
    
    
    static func GetByDay(date: String) {
        request.predicate = NSPredicate(format: "day = %@", argumentArray: [date])
        request.returnsObjectsAsFaults = false
        do {
            print( try managedContext.fetch(request) )
        } catch {
            print(error)
        }
    }
    

    static func ChangeDataForDay(date: String, proportions: [Double], colors: [String]){
        request.predicate = NSPredicate(format: "day = %@", argumentArray: [date])
        request.returnsObjectsAsFaults = false
        do {
            let data = try managedContext.fetch(request)
            print("Got data: \(data)")
            data[0].setValue(colors, forKey: "colors")
            data[0].setValue(proportions, forKey: "proportions")
            try! managedContext.save()
        } catch {
            print(error)
        }
    }
    
    
    static func Add(proportion: Double, color: String, date: String) {
        
    }
}
