//
//  RecipeRequest.swift
//  Reciplease
//
//  Created by David-IOS on 08/08/2021.
//

import Foundation
import Alamofire

class RecipeRequest {
    
    // injection dependency for UnitTests
    private let session : URLSession
    
    init(session : URLSession){
        self.session = session
    }
    
    // This function return a callback to the contoller with 2 parameters
    // Bool : will be true if succes, false if an error is present or incorrect data
    // Recipe : contains the Recipe with ingredients etc...
    func getRecipe(request : URLRequest, callback : @escaping (Bool, Recipes?) -> Void){
        do {
            
         
            
            
            var task : URLSessionDataTask?
            
            task?.cancel()
            task = session.dataTask(with: request) { (data, response, err) in
                DispatchQueue.main.async{
                    // if no data or an error is present return callback(false,nil)
                    guard let data = data else { return callback(false,nil) }
                    // if the statuscode if 200 all is ok, else return callback(false,nil)
                    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return callback(false,nil)}
                    
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
            task?.resume()
        }
    }
    
    // create a request for the api "edamam"
    public func createRecipRequest() -> URLRequest {
        var request = URLRequest(url: URL(string : "https://api.edamam.com/api/recipes/v2?app_key=0dd8b13b990839412c655385191ecebc&app_id=11877b93&q=lemon&type=public")!)
        request.httpMethod = "GET"
        return request
    }
    
}
