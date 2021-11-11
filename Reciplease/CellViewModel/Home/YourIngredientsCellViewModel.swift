//
//  YourIngredientsCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation

class YourIngredientsCellViewModel : TableCellViewModel {
    var height: Float = 66
    
    var estimatedHeight: Float = 66
    
    var indexPath: IndexPath?
    
    var nibName: String? = "YourIngredientsTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?

}
