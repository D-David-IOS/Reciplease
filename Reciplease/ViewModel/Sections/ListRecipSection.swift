//
//  ListRecipSection.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class ListRecipSection : Section {
    var position: Int
    
    var title: String
    

    var cellsVM: [CellViewModel]
    
    init() {
        self.position = 0
        self.title = ""
        self.cellsVM = [CellViewModel]()
        
        let recipCell = RecipCellViewModel(title: "title", ingredients: "tomatoes, mushrooms", imagebackground: URL(fileURLWithPath: "blabla"), routingEntry: RecipListControllerRoutingEntry())
        cellsVM.append(recipCell)

      
    }
}
