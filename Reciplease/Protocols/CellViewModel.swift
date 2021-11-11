//
//  CellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

@objc protocol CellViewModel {
    // the CellViewModel's nibName
    var nibName: String? { get set }
    // the TableViewCell ReuseIdentifier
    var reuseIdentifier: String { get set }
    // the indexPath for know the section and the row
    var indexPath: IndexPath? { get set }
    // the action when a cell is pressed ( push, present, etc... a controller)
    var routingEntry: RoutingEntry? { get set }
}

// only TableEditedCellViewModel can be Edited ( Delete for the Favorite Recipe)
protocol TableEditedCellViewModel: TableCellViewModel {
    var canEdit : Bool { get }
}

protocol TableCellViewModel: CellViewModel {
    // the cell's height
    var height: Float { get }
    var estimatedHeight: Float { get }
}
