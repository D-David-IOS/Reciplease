//
//  Sections.swift
//  Reciplease
//
//  Created by David-IOS on 10/09/2021.
//

import Foundation

protocol Section {
    
    var position: Int { get set }
    var title: String { get set }
    var cellsVM: [CellViewModel] { get set }
}
