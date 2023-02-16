//
//  RecipeReference.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/15.
//

import Foundation

struct RecipeReference : Codable, Identifiable, Hashable {
    let id = UUID()
    var name : String
}
