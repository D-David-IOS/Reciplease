//
//  ListRecipSection.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class ListRecipSection : Section {
    
    // all CellViewModel
    var cellsVM: [CellViewModel]
    
    // Hit : represent an array with all recipe
    var listRecip : [Hit]
    
    init(listRecip : [Hit]) {
        self.cellsVM = [CellViewModel]()
        self.listRecip = listRecip
        
        // if the list is empty we show an cell "No Results Founds"
        if self.listRecip.count == 0 {
            self.cellsVM.append(NoResultFoundCellViewModel())
        } else {
            // for each Recipe we add a RecipeCellViewModel
            for index in 0..<(listRecip.count) {
                self.cellsVM.append(RecipCellViewModel(
                                        recipe: listRecip[index].recipe,
                                        routingEntry: RecipDetailsRoutingEntry(recipe: listRecip[index].recipe)))
            }
            
        }
        
    }
    
}
