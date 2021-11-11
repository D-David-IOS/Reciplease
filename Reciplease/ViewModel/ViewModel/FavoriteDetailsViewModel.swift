//
//  FavoriteDetailsViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class FavoriteDetailsViewModel : ScrollableViewModel {
    
    // all sections
    var sections = [Section]()
    
    let favorite : FavoriteRecipe
    
    init(favorite : FavoriteRecipe){
        self.favorite = favorite
    }
    
    // Load the data, called in the controller
    func loadData(callback: @escaping () -> ()) {
        self.sections.append(FavoriteDetailsSection(favorite: self.favorite))
            callback()
    }
  
}
