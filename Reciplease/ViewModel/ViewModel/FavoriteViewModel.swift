//
//  FavoriteViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation
import CoreData

class FavoriteRecipViewModel : ScrollableViewModel {
    
    var sections = [Section]()
    
    func loadData(callback: @escaping () -> ()) {

        let request : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        guard let favoriteRecipe = try? AppDelegate.viewContext.fetch(request) else {
            self.sections.append(ListFavoriteSection(listRecip: []))
            callback()
            return
        }
        
        self.sections = [ListFavoriteSection(listRecip: favoriteRecipe)]
        

        callback()
        
    }
    
}
