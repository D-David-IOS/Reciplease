//
//  RecipeRequest.swift
//  Reciplease
//
//  Created by David-IOS on 08/08/2021.
//

import Foundation
import SwiftUI
import Alamofire

protocol Requester {
    func getRecipe(callback : @escaping (Bool, Recipes?) -> Void)
}

// TEST
class MockRequester: Requester {
    
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    
    func getRecipe(callback: @escaping (Bool, Recipes?) -> Void) {
        if error != nil {
            callback(false, nil)
        }
    }
}

class ListRecipeViewModelTests {
    
    func test_loadData_whenThereIsAnError() {
        // Given
        let vm = ListRecipViewModel()
        let mockRequester = MockRequester()
        mockRequester.error = NSError()
        vm.requester = mockRequester
        
        // When
        vm.loadData {
            // Then
            
        }
    }
    
}

// PRODUCTION
class RecipeRequest: Requester {
    
    static let shared = RecipeRequest()
    
    
    // This function return a callback to the contoller with 2 parameters
    // Bool : will be true if succes, false if an error is present or incorrect data
    // Recipe : contains the Recipe with ingredients etc...
    func getRecipe(callback : @escaping (Bool, Recipes?) -> Void){
        do {
            AF.request("https://api.edamam.com/api/recipes/v2?app_key=0dd8b13b990839412c655385191ecebc&app_id=11877b93&q=\(ingredientManager.shared.returnIngredientForRequest())&type=public", method: .get).response { response in
                self.handleResponse(response: response, callback: callback)
            }
        }
    }
    
    func handleResponse(response: AFDataResponse<Data?>, callback : (Bool, Recipes?)  -> Void) {
        guard let data = response.data else {
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
    
    // This function return a callback to the contoller with 1 parameter
    // Data : contains the image data , nil if error
    func getImage(imageUrl : String, callback : @escaping (UIImage) -> Void ){
        do{
        
        AF.download(imageUrl).responseData { response in
            guard let data = response.value else {
                callback(UIImage(imageLiteralResourceName: "imageNotFound.jpeg"))
            return
            }
            
            guard let image = UIImage(data: data) else {
                callback(UIImage(imageLiteralResourceName: "imageNotFound.jpeg"))
                return
            }
               callback(image)
            }
           
        }
        
    }
    
    // create a request for the api "edamam"
    private func createRecipRequest() -> URLRequest {
        var request = URLRequest(url: URL(string : "https://api.edamam.com/api/recipes/v2?app_key=0dd8b13b990839412c655385191ecebc&app_id=11877b93&q=lemon&type=public")!)
        request.httpMethod = "GET"
        return request
    }
    
}
