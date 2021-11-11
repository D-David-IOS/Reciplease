//
//  CellConfigurable.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation
import UIKit

// all cell can be configurable
@objc protocol CellConfigurable {
    
    // configure the cell with informations present in the CellViewModel
    func configure(cellViewModel: CellViewModel, from controller: UIViewController)
    
    // add an action when the user tap on the cell, the action is a Routing Entry in the CellViewModel
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController)
}
