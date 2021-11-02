//
//  testCoreData.swift
//  RecipleaseTests
//
//  Created by David-IOS on 02/11/2021.
//

import XCTest
import CoreData
@testable import Reciplease

class CoreDataTests : XCTestCase {
    
    func testAddFavoriteRecipe() {
        
      
        let favoriteRecipe = FavoriteRecipe(context: AppDelegate.viewContext)
        favoriteRecipe.url = "www.blabla.com"
        favoriteRecipe.title = "blabla"
        favoriteRecipe.image = "www.blabla.com"
        favoriteRecipe.ingredients = ["banana","apple"]
        favoriteRecipe.yield = String(20)
        favoriteRecipe.totalTime = String(30)
        try? AppDelegate.viewContext.save()
        
        let request : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        guard let favoriteArray = try? AppDelegate.viewContext.fetch(request) else {
            return
        }
        
        XCTAssertEqual(favoriteArray.count, 1)
        
        let firstFavorite = favoriteArray.first
        
        XCTAssertEqual(firstFavorite?.url, "www.blabla.com")
        XCTAssertEqual(firstFavorite?.title, "blabla")
        XCTAssertEqual(firstFavorite?.image, "www.blabla.com")
        XCTAssertEqual(firstFavorite?.ingredients, ["banana","apple"])
        XCTAssertEqual(firstFavorite?.yield, String(20))
        XCTAssertEqual(firstFavorite?.totalTime, String(30))
        
        let context = AppDelegate.viewContext
        context.delete(favoriteRecipe)
        try? AppDelegate.viewContext.save()
        
        let request2 : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        guard let favoriteRecipe = try? AppDelegate.viewContext.fetch(request2) else {
            return
        }
        
        XCTAssertEqual(favoriteRecipe.count, 0)
    }
    
    
}
