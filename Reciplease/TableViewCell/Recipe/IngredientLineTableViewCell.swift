//
//  IngredientLineTableViewCell.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import UIKit

// this cell represent one ingredients line, we can add this cell as many times we need
class IngredientLineTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientLine: UILabel!
    
   // configure the cell
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? ingredientLineCellViewModel else {
            return
        }
       
        self.ingredientLine.text = " - "+tableCVM.ingredientLine
        
    }
    
}
