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
    
    var favoriteRecipe : FavoriteRecipe {
        let favoriteRecipe = FavoriteRecipe(context: AppDelegate.viewContext)
        favoriteRecipe.url = "www.blabla.com"
        favoriteRecipe.title = "blabla"
        favoriteRecipe.image = "www.blabla.com"
        favoriteRecipe.ingredients = ["banana","apple"]
        favoriteRecipe.yield = String(20)
        favoriteRecipe.totalTime = String(30)
        return favoriteRecipe
    }
    
    func testAddFavoriteRecipe_CheckTheRecipe_DeleteTheRecip() {
        
        // Given : add a favorite Recipe in CoreData
        // save the Favorite Recipe
        let favorite = self.favoriteRecipe
        
        try? AppDelegate.viewContext.save()
        
        let request : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        guard let favoriteArray = try? AppDelegate.viewContext.fetch(request) else {
            return
        }
        
        // Then 1 Favorite Recipe is present in CoreData
        XCTAssertEqual(favoriteArray.count, 1)
        
        let firstFavorite = favoriteArray.first
        
        // Test if all Informations are present
        XCTAssertEqual(firstFavorite?.url, "www.blabla.com")
        XCTAssertEqual(firstFavorite?.title, "blabla")
        XCTAssertEqual(firstFavorite?.image, "www.blabla.com")
        XCTAssertEqual(firstFavorite?.ingredients, ["banana","apple"])
        XCTAssertEqual(firstFavorite?.yield, String(20))
        XCTAssertEqual(firstFavorite?.totalTime, String(30))
        
        // delete the favorite Recipe
        let context = AppDelegate.viewContext
        context.delete(favorite)
        try? AppDelegate.viewContext.save()
        
        let request2 : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        guard let favoriteRecipe = try? AppDelegate.viewContext.fetch(request2) else {
            return
        }
        
        // CoreData is now empty
        XCTAssertEqual(favoriteRecipe.count, 0)
    }
   
}
