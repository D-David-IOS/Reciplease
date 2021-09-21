//
//  searchRecipeTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import UIKit

class SearchRecipeTableViewCell: UITableViewCell {

    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
        guard let routingEntry = cellViewModel.routingEntry, let navController = controller.navigationController else {
            return
        }
        
        let newRouting = Routing()
        let navStyle = PushNavigationStyle(fromNVC: navController,
                                           routingEntry: routingEntry)
        
        _ = newRouting
            .route(navigationStyle: navStyle,
                   animated: true)
    }
}
