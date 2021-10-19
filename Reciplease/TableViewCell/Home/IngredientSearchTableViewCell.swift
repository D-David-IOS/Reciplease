//
//  IngredientSearchTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 16/09/2021.
//

import UIKit

class IngredientSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var IngredientLabel: UILabel!
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? ingredientLineCellViewModel else {
            return
        }
       
        self.IngredientLabel.text = "      - "+tableCVM.ingredientLine
        
    }
}
