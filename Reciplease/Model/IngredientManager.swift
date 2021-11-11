//
//  Ingredient.swift
//  Reciplease
//
//  Created by David-IOS on 06/08/2021.
//

import Foundation

class ingredientManager  {
   
    static let shared = ingredientManager()
  
    // An Array with the ingredients for search
    public var ingredient = ["chicken","lemon","apple"]
    
    // Clear the Array
    func clear(){
        self.ingredient = []
    }
    
    // Add a new ingredient in the Array
    func add(ingredient : String){
        self.ingredient.append(ingredient)
    }
    
    // Return the Array Size
    func size() -> Int {
        return ingredient.count
    }
    
    // Return the ingredient at the index
    func valueAtIndex(index : Int) -> String{
        return ingredient[index]
    }
    
    // Return a String, with all ingredients
    func textAllIngredients(ingredients : [String]) -> String{
        
        var allIngredients = ""
        
        for index in 0..<ingredients.count {
            allIngredients = allIngredients+"\(ingredients[index]), "
        }
        allIngredients.removeLast()
        allIngredients.removeLast()
        return allIngredients
    }
    
    // returns a String with all ingredients with the request example : "banana+apple"
    func returnIngredientForRequest() -> String {
        var ingredients = ""
        for ingredient in self.ingredient {
            ingredients = ingredients+ingredient+"+"
        }
        ingredients.removeLast()
        return ingredients
    }
    
}
