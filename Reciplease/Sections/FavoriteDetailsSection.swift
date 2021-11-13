//
//  FavoriteDetailsSection.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class FavoriteDetailsSection : Section {
    
    // An array with all CellViewModels
    var cellsVM: [CellViewModel]
    
    // the Favorite Recipe
    var favorite : FavoriteRecipe
    
    init(favorite : FavoriteRecipe) {
        self.cellsVM = [CellViewModel]()
        self.favorite = favorite
        
        self.cellsVM.append(IngredientsSearchCellViewModel(ingredientLine: self.favorite.title!))
        
        // we add the top on the page Favorite Details
        self.cellsVM.append(FavoriteDetailsCellViewModel(favorite: favorite))
        
        self.cellsVM.append(IngredientsSearchCellViewModel(ingredientLine: "Ingredients : "))
        
        for index in 0..<favorite.ingredients!.count {
            // we add one line for each ingredients
            self.cellsVM.append(ingredientLineCellViewModel(ingredientLine: favorite.ingredients![index]))
        }
        // we add a button with a routing entry for open the webview in the controller
        self.cellsVM.append(BigButtonCellViewModel(routingEntry: WebRoutingEntry(url: URL(string : favorite.url!)!)))
    }
}
