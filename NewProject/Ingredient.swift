//
//  Ingredient.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

struct Ingredient : Codable, Identifiable, Hashable {
    let id = UUID()
    var recipe_id : Int?
    let recipe_name : String
    let position : String
    var element_id : Int?
    let ingredient_name : String
    let amount : Float
    var element_unit_id : Int?
    let ingredient_unit : String

}
