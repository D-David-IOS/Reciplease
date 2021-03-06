//
//  FavoriteDetailsTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import UIKit

// this class represent the top in a Favorite Details page
class FavoriteDetailsTableViewCell: UITableViewCell {
    var favorite : FavoriteRecipe?
    
    @IBOutlet weak var recipImage: UIImageView!
    @IBOutlet weak var smallImage: UIView!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    let requester = RecipeRequest()

    // Configure the cell
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? FavoriteDetailsCellViewModel else {
            return
        }
        self.favorite = tableCVM.favorite
        self.smallImage.layer.borderWidth = 1
        self.smallImage.layer.cornerRadius = 2
        self.smallImage.layer.borderColor = UIColor.white.cgColor
        self.yieldLabel.text = tableCVM.favorite.yield!+" "
        self.totalTimeLabel.text = tableCVM.favorite.totalTime!+" m"
        
        requester.getImage(imageUrl: tableCVM.favorite.image!) { image in
            self.recipImage.image = image
        }
        
    }

}
