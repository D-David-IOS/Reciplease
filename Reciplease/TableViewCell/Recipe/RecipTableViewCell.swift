//
//  RecipTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import UIKit

class RecipTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var yield: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var smallImage: UIView!
    
    let requester = RecipeRequest()
    
    // the action when the user press the cell, we go to Recipe Details Page
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
       
        guard let routingEntry = cellViewModel.routingEntry, let navController = controller.navigationController else {
            return
        }
       
        let newRouting = Routing()
        _ = newRouting
            .route(routingEntry: routingEntry,
                   fromController: navController)
    }
    
    // configure the cell
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? RecipCellViewModel else {
            return
        }
        self.smallImage.layer.borderWidth = 1
        self.smallImage.layer.cornerRadius = 2
        self.smallImage.layer.borderColor = UIColor.white.cgColor
        self.titleLabel.text = tableCVM.recipe.label
        self.ingredientsLabel.text = ingredientManager.shared.textAllIngredients(ingredients: tableCVM.recipe.ingredientLines)
        
        requester.getImage(imageUrl: tableCVM.recipe.image) { image in
            self.imageBackground.image = image
        }
        
        self.yield.text = String(tableCVM.recipe.yield)+" "
        self.totalTime.text = String(tableCVM.recipe.totalTime)+"m"
        
    }
    
}
