//
//  RecipDetailsTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import UIKit

class RecipDetailsTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var recipImage: UIImageView!
    @IBOutlet weak var smallImage: UIView!
    @IBOutlet weak var yieldLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? RecipDetailsCellViewModel else {
            return
        }
        self.smallImage.layer.borderWidth = 1
        self.smallImage.layer.cornerRadius = 2
        self.smallImage.layer.borderColor = UIColor.white.cgColor
        self.yieldLabel.text = String(tableCVM.yield)+" "
        self.totalTimeLabel.text = String(tableCVM.totalTime)+" m"
        
        RecipeRequest.shared.getImage(imageUrl: tableCVM.recipImage) { image in
            self.recipImage.image = image
        }
        
    }
    
}
