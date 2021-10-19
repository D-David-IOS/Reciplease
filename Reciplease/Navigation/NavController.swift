//
//  NavController.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

@objc protocol NavController: Controller {
    
    func push(controller: Controller, animated: Bool)
    func popController(animated: Bool)
    
}
