//
//  FavoriteDetailsViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class FavoriteDetailsViewModel : ScrollableViewModel {
    
    var sections = [Section]()
    
    let favorite : FavoriteRecipe
    
    init(favorite : FavoriteRecipe){
        self.favorite = favorite
    }
    
    func loadData(callback: @escaping () -> ()) {
        self.sections.append(FavoriteDetailsSection(favorite: self.favorite))
            callback()
    }
  
}
