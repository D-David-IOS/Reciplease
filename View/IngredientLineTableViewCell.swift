//
//  IngredientLineTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import UIKit

class IngredientLineTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientLine: UILabel!
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? ingredientLineCellViewModel else {
            return
        }
       
        self.ingredientLine.text = " - "+tableCVM.ingredientLine
        
    }
    
}
