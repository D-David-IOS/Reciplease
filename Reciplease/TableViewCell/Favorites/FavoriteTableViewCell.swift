//
//  FavoriteTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var yield: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var smallImage: UIView!
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
       
        guard let routingEntry = cellViewModel.routingEntry, let navController = controller.navigationController else {
            return
        }
       
        let newRouting = Routing()
        _ = newRouting
            .route(routingEntry: routingEntry,
                   fromController: navController)
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? FavoriteCellViewModel else {
            return
        }
        self.smallImage.layer.borderWidth = 1
        self.smallImage.layer.cornerRadius = 2
        self.smallImage.layer.borderColor = UIColor.white.cgColor
        self.titleLabel.text = tableCVM.favorite.title
        self.ingredientsLabel.text = ingredientManager.shared.textAllIngredients(ingredients: tableCVM.favorite.ingredients!)
        
        RecipeRequest.shared.getImage(imageUrl: tableCVM.favorite.image!) { image in
            self.imageBackground.image = image
        }
        
        self.yield.text = tableCVM.favorite.yield!+" "
        self.totalTime.text = tableCVM.favorite.totalTime!+"m"
        
    }
}
