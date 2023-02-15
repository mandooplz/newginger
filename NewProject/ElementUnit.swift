//
//  ElementUnit.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

struct ElementUnit : Codable, Equatable, Hashable {
    var id = UUID()
    var element : String
    var unit : String
}
