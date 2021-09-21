//
//  ListFavoriteSection.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class ListFavoriteSection : Section {
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]
    
    var listRecip : [FavoriteRecipe]
    
    init(listRecip : [FavoriteRecipe]) {
        self.position = 0
        self.title = ""
        self.cellsVM = [CellViewModel]()
        self.listRecip = listRecip
        
        if self.listRecip.count == 0 {
            self.cellsVM.append(NoFavoriteCellViewModel())
        } else {
            for favorite in listRecip {
                self.cellsVM.append(FavoriteCellViewModel(favoriteRecipe: favorite, routingEntry: FavoriteDetailsRoutingEntry(favorite: favorite)))
            }
            
        }
        
    }
    
}
