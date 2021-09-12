//
//  RecipeObject.swift
//  Reciplease
//
//  Created by David-IOS on 08/08/2021.
//

import Foundation

// MARK: - Recipes
struct Recipes: Decodable {
    let from : Int
    let to : Int
    let count: Int
    let links: WelcomeLinks
    let hits: [Hit]
    
    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

// MARK: - Hit
struct Hit: Decodable {
    let recipe: Recipe
}

// MARK: - HitLinks
struct HitLinks: Decodable {
    let linksSelf: Next
}

// MARK: - Next
struct Next: Decodable {
    let href: String
}

// MARK: - Recipe
struct Recipe: Decodable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels, healthLabels: [String]
    let ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalWeight: Double
    let totalTime: Int
    let cuisineType, mealType, dishType: [String]?
}

// MARK: - Ingredient
struct Ingredient: Decodable {
    let text: String
    let weight: Double
    let foodCategory: String?
}

// MARK: - RecipesLinks
struct RecipesLinks: Decodable {
    let next: Next
}

// MARK: - WelcomeLinks
struct WelcomeLinks: Decodable {
    let next: Next
}
