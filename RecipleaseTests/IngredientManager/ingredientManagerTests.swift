//
//  ingredientManager.swift
//  RecipleaseTests
//
//  Created by David-IOS on 11/11/2021.
//

import XCTest
@testable import Reciplease

class ingredientManagerTest: XCTestCase {

    
    
    func testClearAndAddIngredients()  {
        ingredientManager.shared.clear()
        XCTAssertEqual(ingredientManager.shared.size(), 0)
        ingredientManager.shared.add(ingredient: "blabla")
        XCTAssertEqual(ingredientManager.shared.valueAtIndex(index: 0) , "blabla")
        ingredientManager.shared.add(ingredient: "apple")
        XCTAssertEqual(ingredientManager.shared.valueAtIndex(index: 1) , "apple")
        XCTAssertEqual(ingredientManager.shared.size(), 2)
        XCTAssertEqual(ingredientManager.shared.returnIngredientForRequest() , "blabla+apple")
        ingredientManager.shared.clear()
        XCTAssertEqual(ingredientManager.shared.size(), 0)
        ingredientManager.shared.add(ingredient: "Chicken")
    }

    func testPerformanceExample()  {
        XCTAssertEqual(ingredientManager.shared.textAllIngredients(ingredients: ["1 cup blabla","2 banana"]), "1 cup blabla, 2 banana")
    }

}
