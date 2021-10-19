//
//  ListRecipSection.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class ListRecipSection : Section {
    
    var cellsVM: [CellViewModel]
    
    var listRecip : [Hit]
    
    init(listRecip : [Hit]) {
        self.cellsVM = [CellViewModel]()
        self.listRecip = listRecip
        
        if self.listRecip.count == 0 {
            self.cellsVM.append(NoResultFoundCellViewModel())
        } else {
            
            
            for index in 0..<(listRecip.count) {
                self.cellsVM.append(RecipCellViewModel(
                                        recipe: listRecip[index].recipe,
                                        routingEntry: RecipDetailsRoutingEntry(recipe: listRecip[index].recipe)))
            }
            
        }
        
    }
    
}
