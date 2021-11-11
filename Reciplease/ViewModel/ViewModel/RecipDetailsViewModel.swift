//
//  RecipDetailsViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class RecipDetailsViewModel : ScrollableViewModel {
    
    // all Sections
    var sections = [Section]()
    
    let recipe : Recipe
    
    init(recipe : Recipe){
        self.recipe = recipe
    }
    
    // load the data, called in the Controller
    func loadData(callback: @escaping () -> ()) {
        self.sections.append(RecipDetailsSection(recipe: recipe))
            callback()
    }
}
