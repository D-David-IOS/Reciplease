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
        
        RecipeRequest.shared.getRecipe { success, recipe in
            
            guard recipe != nil else {
                self.sections.append(ListRecipSection(listRecip: []))
                callback()
                return
            }
            
            self.sections.append(ListRecipSection(listRecip: recipe!.hits))
            callback()
        }
    }
    
  
}
