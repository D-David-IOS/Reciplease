//
//  UITableViewCell+CellConfigurable.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

import UIKit

extension UITableViewCell: CellConfigurable {
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed or override on subclasses
    }
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {

    }
    
}
