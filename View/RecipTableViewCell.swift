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
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? RecipCellViewModel else {
            return
        }
        
        self.titleLabel.text = "Pizza"
        self.ingredientsLabel.text = "ingrédients"
    }
    
}
