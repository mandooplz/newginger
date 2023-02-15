//
//  Method.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

struct Method : Codable, Identifiable, Hashable {
    let id = UUID()
    var recipe_id : Int?
    let recipe_name : String
    let number : Int
    let method : String
    
}
