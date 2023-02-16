//
//  ElementGroup.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

struct ElementGroup : Identifiable, Codable {
    // StartContainer의 id, name
    var id : Int
    var name : String
    
    var mainCategory : String
    var subCategory : String
    
    var ECs : [EC] = []
    var SCEs : [SCE] = []
}

struct EC : Codable, Identifiable {
    // EndContainer의 id, name
    var id : Int
    var name : String
    var conncetion : EGConnection
    
    var ECEs : [ECE] = []
}

struct ECE : Codable, Identifiable {
    // EndContainerElement의 id, name
    var id : Int
    var name : String
    var connection : EGConnection
}

struct SCE : Codable, Identifiable {
    // StartContainerElement의 id, name
    var id : Int
    var name : String
    
    var connnection : EGConnection
}

// ElementGroup의 Coonec
enum EGConnection : Codable {
    case vertical(type : String)
    case horizontal(type : String)
}
