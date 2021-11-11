//
//  RecipleaseTests.swift
//  RecipleaseTests
//
//  Created by David-IOS on 06/08/2021.
//

import XCTest
import Alamofire
@testable import Reciplease

class RecipleaseTests: XCTestCase {
    
    let fakeData = FakeData()
    let url = URL(string: "https://api.edamam.com/api/recipes/v2?app_key=0dd8b13b990839412c655385191ecebc&app_id=11877b93&q=\(ingredientManager.shared.returnIngredientForRequest())&type=public")!
    let urlLiteral =  "https://api.edamam.com/api/recipes/v2?app_key=0dd8b13b990839412c655385191ecebc&app_id=11877b93&q=\(ingredientManager.shared.returnIngredientForRequest())&type=public"
    
    func testGoodStatusGoodDataSoGoodCallback() {
            let FakeRequest = RecipeRequest()
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)
            FakeRequest.sessionManager = sessionManager
            let expectation = expectation(description: "Request should finish")
        
        let mock = Mock(url : url, dataType: .json, statusCode: 200, data: [.get: fakeData.correctData])
            mock.register()

        FakeRequest.getRecipe(url : urlLiteral) { success, recipe in
            
            XCTAssertNotNil(recipe)
            XCTAssertEqual(recipe?.hits.count,20)
            XCTAssertTrue(success)
            expectation.fulfill()
             
            }
            wait(for: [expectation], timeout: 10.0)
        }
    
    func testBadStatusCodeSoCallbackNil() {
            let FakeRequest = RecipeRequest()
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)
            FakeRequest.sessionManager = sessionManager
            let requestExpectation = expectation(description: "Request should finish")
        
            

        let mock = Mock(url : url, dataType: .json, statusCode: 500, data: [.get: fakeData.correctData])
            mock.register()

        FakeRequest.getRecipe(url : urlLiteral) { success, recipe in
            
                    XCTAssertNil(recipe)
                    XCTAssertFalse(success)
                    requestExpectation.fulfill()
             
            }
            wait(for: [requestExpectation], timeout: 10)
        }
    
    func testIncorrectDataSoCallbackNil() {
            let FakeRequest = RecipeRequest()
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)
            FakeRequest.sessionManager = sessionManager
            let requestExpectation = expectation(description: "Request should finish")
        
        let mock = Mock(url : url, dataType: .json, statusCode: 200, data: [.get: fakeData.incorrectData])
            mock.register()

        
        FakeRequest.getRecipe(url : urlLiteral) { success, recipe in
            
                    XCTAssertNil(recipe)
                    XCTAssertFalse(success)
                    requestExpectation.fulfill()
             
            }
            wait(for: [requestExpectation], timeout: 10)
        }
    
    func testGetImageBadResponse() {
            let FakeRequest = RecipeRequest()
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)
            FakeRequest.sessionManager = sessionManager
            let requestExpectation = expectation(description: "Request should finish")
        
        let mock = Mock( dataType: .imagePNG, statusCode: 200, data: [.get: fakeData.imageData!])
            mock.register()

        Mocker.mode = .optin
        
        FakeRequest.getImage(imageUrl : "https://www.edamam.com/web-img/112/11271441ea20808734210d68d08b2a8e.jpg") { image in
            
                    XCTAssertNotNil(image)
                    requestExpectation.fulfill()
             
            }
            wait(for: [requestExpectation], timeout: 10)
        }
    
    func testGetImageIncorrectData() {
            let FakeRequest = RecipeRequest()
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)
            FakeRequest.sessionManager = sessionManager
            let requestExpectation = expectation(description: "Request should finish")
        
        let mock = Mock(dataType: .json, statusCode: 500, data: [.get: fakeData.incorrectData])
            mock.register()
        
        Mocker.mode = .optout

        FakeRequest.getImage(imageUrl : "https://www.edamam.com/web-img/112/11271441ea20808734210d68d08b2a8e.jpg") { image in
            
            XCTAssertNotNil(image)
            requestExpectation.fulfill()
             
            }
            wait(for: [requestExpectation], timeout: 10)
        }
    
    func testGetImageStatus500() {
            let FakeRequest = RecipeRequest()
            let configuration = URLSessionConfiguration.af.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            let sessionManager = Alamofire.Session(configuration: configuration)
            FakeRequest.sessionManager = sessionManager
            let requestExpectation = expectation(description: "Request should finish")
        
        let mock = Mock(dataType: .json, statusCode: 500, data: [.get: fakeData.imageData!])
            mock.register()

        FakeRequest.getImage(imageUrl : "https://www.edamam.com/web-img/112/11271441ea20808734210d68d08b2a8e.jpg") { image in
            
            XCTAssertNotNil(image)
            requestExpectation.fulfill()
             
            }
            wait(for: [requestExpectation], timeout: 10)
        }
}
