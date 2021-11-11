//
//  UITableViewCell+CellConfigurable.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

import UIKit

extension UITableViewCell: CellConfigurable {
    
    // configure the cell with informations present in the CellViewModel
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed or override on subclasses
    }
    
    // add an action when the user tap on the cell, the action is a Routing Entry in the CellViewModel
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed or override on subclasses
    }
    
}
