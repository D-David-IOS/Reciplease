//
//  HomeSection.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation

class HomeSection : Section {
    var position: Int
    
    var title: String

    var cellsVM: [CellViewModel]
    
    init() {
        self.position = 0
        self.title = ""
        self.cellsVM = [CellViewModel]()

        self.cellsVM.append(SearchBarCellViewModel())
        
        self.cellsVM.append(SearchRecipeCellViewModel())
    }
}
