//
//  Sections.swift
//  Reciplease
//
//  Created by David-IOS on 10/09/2021.
//

import Foundation

protocol Section {
    // a Section contain an CellViewModelArray
    var cellsVM: [CellViewModel] { get set }
}
