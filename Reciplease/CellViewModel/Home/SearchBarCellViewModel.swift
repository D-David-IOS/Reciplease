//
//  SearchBarCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation

class SearchBarCellViewModel : TableCellViewModel {
    var height: Float = 424
    
    var estimatedHeight: Float = 424
    
    var indexPath: IndexPath?
    
    var nibName: String? = "SearchBarTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?

}
