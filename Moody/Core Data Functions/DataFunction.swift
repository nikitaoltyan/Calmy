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
    static func AddDataToModel(name: String, age: Int32){
        let newName = Model(context: managedContext)
        newName.name = name
        newName.age = age
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
}
