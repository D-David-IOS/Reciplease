//
//  IngredientLineCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class ingredientLineCellViewModel : TableCellViewModel {
    var height: Float = 20
    
    var estimatedHeight: Float = 20
    
    var indexPath: IndexPath?
    
    var nibName: String? = "IngredientLineTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
    
    var ingredientLine : String
    
    init(ingredientLine : String) {
        self.ingredientLine = ingredientLine
    }
    
}
