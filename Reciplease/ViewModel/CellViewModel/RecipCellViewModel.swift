//
//  RecipCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class RecipCellViewModel : TableCellViewModel {
    var height: Float = 115
    
    var estimatedHeight: Float = 115
    
    var indexPath: IndexPath?
    
    var nibName: String? = "RecipTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
    
    var title: String?
    var ingredients: String?
    var imageBackground: URL
    
    init(title: String, ingredients: String, imagebackground: URL, routingEntry: RoutingEntry) {
        
        self.title = title
        self.ingredients = ingredients
        self.imageBackground = imagebackground
        self.routingEntry = routingEntry
    }
    
}
