//
//  FakeResponseData.swift
//  RecipleaseTests
//
//  Created by David-IOS on 02/11/2021.
//

import Foundation

class FakeData {
    
    let responseOK = HTTPURLResponse(url: URL(string: "www.google.fr")!,statusCode: 200, httpVersion: nil, headerFields: nil)!
    let responseKO = HTTPURLResponse(url: URL(string: "www.google.fr")!,statusCode: 500, httpVersion: nil, headerFields: nil)!
   
    var correctData : Data {
        let bundle = Bundle(for: FakeData.self)
        let url = bundle.url(forResource: "Recipe", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    var incorrectData : Data {
        let bundle = Bundle(for: FakeData.self)
        let url = bundle.url(forResource: "translate", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }

    let imageData = "image with a long description .........".data(using: .utf8)
}
