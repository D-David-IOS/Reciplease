//
//  BigButtonTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import UIKit

class BigButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var bigButton: UIButton!
    
    // the action when the cell is Pressed ( not the button, he is disabled)
    // we go in the WebView with an URL ( Ref to the CellViewModel)
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let navController = controller as? TableViewController, let routingEntry = cellViewModel.routingEntry else {
            return
        }
        
        let newRouting = Routing()
        _ = newRouting
            .route(routingEntry: routingEntry,
                   fromController: navController)
    }
}
