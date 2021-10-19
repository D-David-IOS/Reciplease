//
//  FavoritesManager.swift
//  Reciplease
//
//  Created by David-IOS on 20/09/2021.
//

import Foundation
import CoreData

class FavoritesManager  {
   
    static let shared = FavoritesManager()
  
    public var Favorites = [FavoriteRecipe]()
    
    
    func clear(){
        self.Favorites = []
    }
    
    func add(recipe : FavoriteRecipe){
        Favorites.append(recipe)
    }
    
    func size() -> Int {
        return Favorites.count
    }
    
    func valueAtIndex(index : Int) -> FavoriteRecipe{
        return Favorites[index]
    }
    
}
