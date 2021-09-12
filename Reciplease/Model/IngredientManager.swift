//
//  Ingredient.swift
//  Reciplease
//
//  Created by David-IOS on 06/08/2021.
//

import Foundation

class ingredientManager {
    
    static let shared = ingredientManager()
    
    private var ingredient = ["chicken","lemon","apple"]

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
    
    func textAllIngredients(ingredients : [Ingredient]) -> String{
        
        var allIngredients = ""
        
        for index in 0..<ingredients.count {
            if index == (ingredients.count-1){
                allIngredients = allIngredients+" \(ingredients[index].foodCategory ?? "")"
            } else {
                allIngredients = allIngredients+" \(ingredients[index].foodCategory ?? ""),"
            }
        }
        
        return allIngredients
    }
    
    func convertMinuteToHour(minute : Int) -> String{
        return "1"
    }
    
}
