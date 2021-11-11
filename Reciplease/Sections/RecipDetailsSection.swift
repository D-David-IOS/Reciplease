//
//  RecipDetailsSection.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class RecipDetailsSection : Section {
    
    // All CellViewModels
    var cellsVM: [CellViewModel]
    
    var recipe : Recipe
    
    init(recipe : Recipe) {
        self.cellsVM = [CellViewModel]()
        self.recipe = recipe
        
        // represent the top in the page Recipe Details
        self.cellsVM.append(RecipDetailsCellViewModel(recipe: recipe))
        
        for index in 0..<recipe.ingredientLines.count {
            // we add one ingredient line for each ingredients
            self.cellsVM.append(ingredientLineCellViewModel(ingredientLine: recipe.ingredientLines[index]))
        }
        
        // the button on the bottom for open the url in a WebView
        self.cellsVM.append(BigButtonCellViewModel(routingEntry: WebRoutingEntry(url: URL(string : recipe.url)!)))
    }
    
}
