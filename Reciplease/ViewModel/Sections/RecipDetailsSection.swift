//
//  RecipDetailsSection.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class RecipDetailsSection : Section {
    var position: Int
    
    var title: String

    var cellsVM: [CellViewModel]
    
    var recipe : Recipe
    
    init(recipe : Recipe) {
        self.position = 0
        self.title = ""
        self.cellsVM = [CellViewModel]()
        self.recipe = recipe
        
        
        self.cellsVM.append(RecipDetailsCellViewModel(recipe: recipe))
        
        for index in 0..<recipe.ingredientLines.count {
            self.cellsVM.append(ingredientLineCellViewModel(ingredientLine: recipe.ingredientLines[index]))
        }
        
        
        self.cellsVM.append(BigButtonCellViewModel())
    }
    

    
}
