//
//  ListRecipViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class ListRecipViewModel : ScrollableViewModel {
    
    // an API instance for the request
    let requester = RecipeRequest()
    
    // all section
    var sections = [Section]()
    
    // tell the Controller when data are finished to load
    var isLoading = false
    
    // In the request we ask only 20 Recipe
    // Next represent the link with 20 other Recipes
    var next : String?
    
    // we use the function GetRecipe for downland and decode 20 Recipe
    // then load the data, this function is called in the controller
    func loadData(callback: @escaping () -> ()) {
        
        // search 20 Recipes with the ingredients present in IngredientsManager
        // succes is a Boolean, false if the request failed
        // Recipe : an array with 20 Recipes
        requester.getRecipe(url: "https://api.edamam.com/api/recipes/v2?app_key=0dd8b13b990839412c655385191ecebc&app_id=11877b93&q=\(ingredientManager.shared.returnIngredientForRequest())&type=public") { success, recipe in
            
            // if we have no Recipe, we return an empty array
            // in the section we will show an cell with "No results found"
            guard recipe != nil && success else {
                self.sections.append(ListRecipSection(listRecip: []))
                callback()
                return
            }
            
            // add a Section with all Recipes
            self.sections.append(ListRecipSection(listRecip: recipe!.hits))
            
            // the link for the 20 next Recipe
            // used in the function "LoadMore"
            self.next = recipe?.links.next.href
            callback()
        }
    }
    
    // Add 20 new cell in the TableView
    func loadMore(callback: @escaping () -> ()) {
        
        // the next 20 Recipes link
        // it can be nil, that's why we test if we can launch a request
        guard let url = self.next else {
            callback()
            return
        }
        
        // search 20 other Recipes with the Next link
        // succes is a Boolean, false if the request failed
        // Recipe : an array with 20 new Recipes
        requester.getRecipe(url: url) { success, recipe in
            
            // if the next link is empty, nothing happend
            guard recipe != nil && success else {
                callback()
                return
            }
            
            // we had an another Section with 20 news Recipes
            self.sections.append(ListRecipSection(listRecip: recipe!.hits))
            
            // the link for the 20 next Recipe
            self.next = recipe?.links.next.href
            self.isLoading = false
            callback()
        }
    }
    
  
}
