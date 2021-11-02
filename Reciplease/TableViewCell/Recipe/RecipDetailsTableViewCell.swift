//
//  RecipDetailsTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import UIKit
import CoreData

class RecipDetailsTableViewCell: UITableViewCell {

    var recipe : Recipe?
    
    let requester = RecipeRequest()
    
    @IBOutlet weak var recipImage: UIImageView!
    @IBOutlet weak var smallImage: UIView!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    

    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? RecipDetailsCellViewModel else {
            return
        }
        self.recipe = tableCVM.recipe
        self.smallImage.layer.borderWidth = 1
        self.smallImage.layer.cornerRadius = 2
        self.smallImage.layer.borderColor = UIColor.white.cgColor
        self.yieldLabel.text = String(tableCVM.recipe.yield)+" "
        self.totalTimeLabel.text = String(tableCVM.recipe.totalTime)+" m"
        
        requester.getImage(imageUrl: tableCVM.recipe.image) { image in
            self.recipImage.image = image
        }
        
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        starButton.isEnabled = false
        saveRecip(recipe: recipe!)
    }
    
    private func saveRecip(recipe : Recipe){
        let favoriteRecipe = FavoriteRecipe(context: AppDelegate.viewContext)
        favoriteRecipe.url = recipe.url
        favoriteRecipe.title = recipe.label
        favoriteRecipe.image = recipe.image
        favoriteRecipe.ingredients = recipe.ingredientLines
        favoriteRecipe.yield = String(recipe.yield)
        favoriteRecipe.totalTime = String(recipe.totalTime)
        try? AppDelegate.viewContext.save()
    }
}
