//
//  RecipDetailsTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import UIKit
import CoreData

// this class represent the top ine the Recipe Details Page
class RecipDetailsTableViewCell: UITableViewCell {

    // the recipe with all informations
    var recipe : Recipe?
    
    let requester = RecipeRequest()
    
    @IBOutlet weak var recipImage: UIImageView!
    @IBOutlet weak var smallImage: UIView!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    var saved = false
    var favorite : FavoriteRecipe?
    
    // configure the cell
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
    
    // change the star color to yellow and add a new favorite recipe in Coredata
    @IBAction func addFavorite(_ sender: Any) {
        if self.saved {
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            deleteRecipe(favorite : self.favorite!)
        } else {
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            saveRecip(recipe: self.recipe!)
        }
    }
    
    // this function can be used for save a Recipe in CoreData
    private func saveRecip(recipe : Recipe){
        let favoriteRecipe = FavoriteRecipe(context: AppDelegate.viewContext)
        favoriteRecipe.url = recipe.url
        favoriteRecipe.title = recipe.label
        favoriteRecipe.image = recipe.image
        favoriteRecipe.ingredients = recipe.ingredientLines
        favoriteRecipe.yield = String(recipe.yield)
        favoriteRecipe.totalTime = String(recipe.totalTime)
        try? AppDelegate.viewContext.save()
        self.favorite = favoriteRecipe
        self.saved = true
    }
    
    private func deleteRecipe(favorite : FavoriteRecipe){
        let context = AppDelegate.viewContext
        
        context.delete(self.favorite!)
        try? AppDelegate.viewContext.save()
        self.saved = false
    }
}
