//
//  Element.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

struct Element : Identifiable, Codable, Hashable {
    let id : Int
    let name : String
    
    private enum CodingKeys : String, CodingKey {
        case id = "element_id"
        case name = "element_name"
    }
    
    var idStr : String { String(id) }
}
