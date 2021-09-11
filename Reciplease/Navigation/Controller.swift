//
//  Controller.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

@objc protocol Controller {
    
    var presentedController: Controller? { get }
    
    func present(controller: Controller,
                 animated: Bool,
                 completion: @escaping () -> ())
    func dismissController(animated: Bool, completion: @escaping () -> ())
    
}
