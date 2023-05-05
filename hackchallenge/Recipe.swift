//
//  Recipe.swift
//  hackchallenge
//
//  Created by Katherine Wei on 4/30/23.
//

import Foundation

struct Recipe: Codable {
    let id: Int
    let title: String
    let description: String
    let ingredients: String
    let steps: String
    let cuisine: [Category]
    let meal_type: [Category]
    let prep_time: [Category]
}

struct RecipeList: Codable {
    let recipes: [Recipe]
}

