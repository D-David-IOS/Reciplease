//
//  FavoriteDetailsSection.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class FavoriteDetailsSection : Section {
    var position: Int
    
    var title: String

    var cellsVM: [CellViewModel]
    
    var favorite : FavoriteRecipe
    
    init(favorite : FavoriteRecipe) {
        self.position = 0
        self.title = ""
        self.cellsVM = [CellViewModel]()
        self.favorite = favorite
        
        
        self.cellsVM.append(FavoriteDetailsCellViewModel(favorite: favorite))
        
        for index in 0..<favorite.ingredients.count {
            self.cellsVM.append(ingredientLineCellViewModel(ingredientLine: favorite.ingredients[index]))
        }
        self.cellsVM.append(BigButtonCellViewModel())
    }
}
