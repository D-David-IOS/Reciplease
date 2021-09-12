//
//  RecipDetailsViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class RecipDetailsViewModel : ScrollableViewModel {
    
    var sections = [Section]()
    
    let recipe : Recipe
    
    init(recipe : Recipe){
        self.recipe = recipe
    }
    
    func loadData(callback: @escaping () -> ()) {
        
        self.sections.append(RecipDetailsSection(recipe: recipe))
            callback()
        
    }
  
}
