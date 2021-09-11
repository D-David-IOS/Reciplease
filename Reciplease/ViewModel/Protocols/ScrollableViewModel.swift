//
//  ScrollableViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 10/09/2021.
//

import Foundation

protocol ScrollableViewModel {
        
    var sections: [Section] { get set }
    
    func loadData(callback: () -> ())
    
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
    
}
