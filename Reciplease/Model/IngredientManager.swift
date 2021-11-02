//
//  Ingredient.swift
//  Reciplease
//
//  Created by David-IOS on 06/08/2021.
//

import Foundation

class ingredientManager  {
   
    
    static let shared = ingredientManager()
  
    public var ingredient = ["chicken","lemon","apple"]
    
    func clear(){
        self.ingredient = []
    }
    
    func add(ingredient : String){
        self.ingredient.append(ingredient)
    }
    
    func size() -> Int {
        return ingredient.count
    }
    
    func valueAtIndex(index : Int) -> String{
        return ingredient[index]
    }
    
    func textAllIngredients(ingredients : [String]) -> String{
        
        var allIngredients = ""
        
        for index in 0..<ingredients.count {
            allIngredients = allIngredients+" \(ingredients[index]),"
        }
        return allIngredients
    }
    
    func returnIngredientForRequest() -> String {
        var ingredients = ""
        for ingredient in self.ingredient {
            ingredients = ingredients+ingredient+"+"
        }
        return ingredients
    }
    
}
