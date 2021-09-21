//
//  IngredientSearchCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 16/09/2021.
//

import Foundation

class IngredientsSearchCellViewModel : TableCellViewModel {
    var height: Float = 50
    
    var estimatedHeight: Float = 50
    
    var indexPath: IndexPath?
    
    var nibName: String? = "IngredientLineTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
    
    var ingredientLine : String
    
    init(ingredientLine : String) {
        self.ingredientLine = ingredientLine
    }
    
}
