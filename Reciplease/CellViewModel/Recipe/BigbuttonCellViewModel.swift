//
//  BigbuttonCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class BigButtonCellViewModel : TableCellViewModel {
    var height: Float = 71
    
    var estimatedHeight: Float = 71
    
    var indexPath: IndexPath?
    
    var nibName: String? = "BigButtonTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?

    init(routingEntry : RoutingEntry){
        self.routingEntry = routingEntry
    }

}
