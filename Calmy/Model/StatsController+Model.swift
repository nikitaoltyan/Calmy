//
//  StatsController+Model.swift
//  Calmy
//
//  Created by Никита Олтян on 03.05.2021.
//

import Foundation
import UIKit

protocol StatsControllerModelDelegate {
    func reloadTableWithData(_ model: [Model]?)
}


class StatsControllerModel {
    
    var delegate: StatsControllerModelDelegate?
    var model: [Model]?
    
    init() {
        fetchData()
    }
    
    func fetchData(){
        print("fetch Data")
        model = DataFunction.fetchAllData()
        model?.reverse()
        delegate?.reloadTableWithData(model)
    }
}
