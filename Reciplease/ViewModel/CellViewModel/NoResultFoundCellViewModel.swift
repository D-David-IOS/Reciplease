//
//  NoResultFoundCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class NoResultFoundCellViewModel : TableCellViewModel {
    var height: Float = 144
    
    var estimatedHeight: Float = 144
    
    var indexPath: IndexPath?
    
    var nibName: String? = "NoResultFoundTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
 
}
