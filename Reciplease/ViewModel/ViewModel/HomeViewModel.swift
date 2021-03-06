//
//  HomeViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation

class HomeViewModel : ScrollableViewModel {
    
    // all sections
    var sections = [Section]()
    
    // load the data, called in the Controller
    func loadData(callback: @escaping () -> ()) {
        self.sections.append(HomeSection())
        callback()
    }
  
}
