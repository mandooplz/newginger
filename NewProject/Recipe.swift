//
//  File.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

// 이때의 Recipe는 레시피를 업로드하는 용도로 사용
struct Recipe : Identifiable,Codable, Hashable {
    let id = UUID()
    let recipe_name : String
    let category : String
    let yield : Int
    let reference : String
    
    private enum CodingKeys : String, CodingKey {
        case id = "recipe_id"
        case recipe_name
        case category
        case yield
        case reference
    }
}
