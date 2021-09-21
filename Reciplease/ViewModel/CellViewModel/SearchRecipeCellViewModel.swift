//
//  searchRecipeCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation

class SearchRecipeCellViewModel : TableCellViewModel {
    var height: Float = 67
    
    var estimatedHeight: Float = 67
    
    var indexPath: IndexPath?
    
    var nibName: String? = "SearchRecipeTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
  
    init(){
        self.routingEntry = RecipListRoutingEntry()
    }
}
