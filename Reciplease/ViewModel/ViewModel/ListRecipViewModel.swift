//
//  ListRecipViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class ListRecipViewModel : ScrollableViewModel {
    
    var sections = [Section]()
    
    func loadData(callback: () -> ()) {
        sections.append(ListRecipSection())

        callback()
    }
    
    
}
