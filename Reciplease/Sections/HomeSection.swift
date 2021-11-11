//
//  HomeSection.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation

class HomeSection : Section {
    
    // all CellViewModels
    var cellsVM: [CellViewModel]
    
    init() {
        self.cellsVM = [CellViewModel]()

        // reprensent the top in Home
        self.cellsVM.append(SearchBarCellViewModel())
        
        // represent the Button Search at the bottom in Home
        self.cellsVM.append(SearchRecipeCellViewModel())
    }
}
