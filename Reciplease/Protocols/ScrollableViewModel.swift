//
//  ScrollableViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 10/09/2021.
//

import Foundation

// all ViewModel has a Section Array and a function LoadData called in the Controller
protocol ScrollableViewModel {
        
    var sections: [Section] { get set }
    
    func loadData(callback: @escaping () -> ())
    
}

extension ScrollableViewModel {
    
    func numberOfSections() -> Int {
        return self.sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard self.sections.count > 0 else {
            return 0
        }
        return self.sections[section].cellsVM.count
    }
    
    func item(at indexPath: IndexPath) -> CellViewModel {
        return self.sections[indexPath.section].cellsVM[indexPath.row]
    }
    
    mutating func remove(at indexPath : IndexPath) -> () {
        self.sections[indexPath.section].cellsVM.remove(at: indexPath.row)
    }
}
