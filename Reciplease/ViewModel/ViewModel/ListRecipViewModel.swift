//
//  ListRecipViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class ListRecipViewModel : ScrollableViewModel {
    
    var sections = [Section]()
    var requester: Requester!
    
    func loadData(callback: @escaping () -> ()) {
        
        self.requester.getRecipe { success, recipe in
            
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
