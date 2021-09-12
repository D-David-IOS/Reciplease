//
//  ListRecipViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class ListRecipViewModel : ScrollableViewModel {
    
    var sections = [Section]()
    
    func loadData(callback: @escaping () -> ()) {
        
        RecipeRequest.shared.getRecipe { success, Recipe in
            // need implement empty result
            self.sections.append(ListRecipSection(listRecip: Recipe!.hits))
            callback()
        }
    }
  
}
