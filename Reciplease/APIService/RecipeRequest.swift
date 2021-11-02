//
//  RecipeRequest.swift
//  Reciplease
//
//  Created by David-IOS on 08/08/2021.
//

import Foundation
import SwiftUI
import Alamofire

class RecipeRequest {
    
    var sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 10
        configuration.waitsForConnectivity = false
        return Session(configuration: configuration)
    }()
    
    
    // This function return a callback to the contoller with 2 parameters
    // Bool : will be true if succes, false if an error is present or incorrect data
    // Recipe : contains the Recipe with ingredients etc...
    func getRecipe(callback : @escaping (Bool, Recipes?) -> Void){
        do {
            sessionManager.request("https://api.edamam.com/api/recipes/v2?app_key=0dd8b13b990839412c655385191ecebc&app_id=11877b93&q=\(ingredientManager.shared.returnIngredientForRequest())&type=public", method: .get).responseDecodable(of: Recipes.self) { response in
                
                guard let data = response.data,response.response?.statusCode == 200 else {
                    callback(false,nil)
                    return
                }
                
                do {
                    // here we have data, so we try to decode into a recipe
                    let recipe = try JSONDecoder().decode(Recipes.self, from: data)
                    callback(true, recipe)
                } catch let jsonErr {
                    // if decode failed, return an error and callback(false,nil)
                    print("Erreur de décodage", jsonErr)
                    callback(false,nil)
                }
            }
        }
    }
    
    // This function return a callback to the contoller with 1 parameter
    // Data : contains the image data , nil if error
    func getImage(imageUrl : String, callback : @escaping (UIImage) -> Void ){
        do{
        
        sessionManager.download(imageUrl).responseData { response in
            
            guard response.response?.statusCode == 200, let data = response.value, let image = UIImage(data: data) else {
                callback(UIImage(imageLiteralResourceName: "imageNotFound.jpeg"))
            return
            }
            
               callback(image)
            }
           
        }
        
    }

}
