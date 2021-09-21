//
//  HomeViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation

class HomeViewModel : ScrollableViewModel {
    
    var sections = [Section]()
    
    func loadData(callback: @escaping () -> ()) {
        self.sections.append(HomeSection())
        callback()
    }
  
}
