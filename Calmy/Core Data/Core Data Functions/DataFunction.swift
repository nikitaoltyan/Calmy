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
    
    
    static func GetByName(name: String) {
        request.predicate = NSPredicate(format: "name = %@", argumentArray: [name])
        request.returnsObjectsAsFaults = false
        do {
            print( try managedContext.fetch(request) )
        } catch {
            print(error)
        }
    }
    

    static func Change(){
        request.predicate = NSPredicate(format: "name = %@", argumentArray: ["Nikita"])
        request.returnsObjectsAsFaults = false
        do {
//            let data = try managedContext.fetch(request)
//            print("Got data: \(data)")
//            var arr = data[0].arr
//            print("Arr: \(arr), count: \(arr.count)")
//            arr.insert(99, at: arr.count-1)
//            print("Arr: \(arr), count: \(arr.count)")
//            data[0].setValue(arr, forKey: "arr")
            try! managedContext.save()
        } catch {
            print(error)
        }
    }
}
