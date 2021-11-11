//
//  FavoriteViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation
import CoreData

class FavoriteRecipViewModel : ScrollableViewModel {
    
    // all sections
    var sections = [Section]()
    
    // load the data, called in the controller
    func loadData(callback: @escaping () -> ()) {

        // ask to CoreData, how many Favorite Recipe are present
        let request : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        
        // if CoreData is Empty we send an empty Callback
        guard let favoriteRecipe = try? AppDelegate.viewContext.fetch(request) else {
            self.sections.append(ListFavoriteSection(listRecip: []))
            callback()
            return
        }
        
        // send a callback with all Favorite Recipes
        self.sections = [ListFavoriteSection(listRecip: favoriteRecipe)]
        
        callback()
    }
}
