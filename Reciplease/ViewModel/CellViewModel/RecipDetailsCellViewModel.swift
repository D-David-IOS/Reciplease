//
//  RecipDetailsCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class RecipDetailsCellViewModel : TableCellViewModel {
    var height: Float = 194
    
    var estimatedHeight: Float = 194
    
    var indexPath: IndexPath?
    
    var nibName: String? = "RecipDetailsTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
    

    var recipImage: String
    var yield : Int
    var totalTime : Int
    
    init(recipImage: String,yield : Int, totalTime : Int) {
        
        self.recipImage = recipImage
        self.yield = yield
        self.totalTime = totalTime
    }
    
}
