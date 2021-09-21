//
//  TableIngredientsCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 16/09/2021.
//

import Foundation

class TableIngredientsCellViewModel : TableCellViewModel {
    var height: Float = 228
    
    var estimatedHeight: Float = 228
    
    var indexPath: IndexPath?
    
    var nibName: String? = "TableIgredientsTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
 
}
