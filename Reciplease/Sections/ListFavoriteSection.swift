//
//  ListFavoriteSection.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class ListFavoriteSection : Section {
    
    // All CellViewModels
    var cellsVM: [CellViewModel]
    
    // All favorite recipe in CoreData
    var listRecip : [FavoriteRecipe]
    
    init(listRecip : [FavoriteRecipe]) {
        self.cellsVM = [CellViewModel]()
        self.listRecip = listRecip
        
        // if the user has no favorite we show him how to add a favorite
        if self.listRecip.count == 0 {
            self.cellsVM.append(NoFavoriteCellViewModel())
        } else {
            // for each Favorite Recipe in CoreData we add a FavoriteCellViewModel
            for favorite in listRecip {
                self.cellsVM.append(FavoriteCellViewModel(favoriteRecipe: favorite, routingEntry: FavoriteDetailsRoutingEntry(favorite: favorite)))
            }
            
        }
        
    }
    
}
