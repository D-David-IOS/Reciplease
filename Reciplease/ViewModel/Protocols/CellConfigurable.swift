//
//  CellConfigurable.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation
import UIKit

@objc protocol CellConfigurable {
    func configure(cellViewModel: CellViewModel, from controller: UIViewController)
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController)
}
