//
//  RecipeGroupLog.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/16.
//

import Foundation

// 기존의 ElementGroup에 추가한 경우, 새로운 ElementGrup을 만든 경우 둘다 Log가 기록 가능해야 한다.
// 새로 생성한 EG의 경우 EGs에 추가되나?
struct RecipeGroupLog : Identifiable {
    var id = UUID()
    
    var recipe : Recipe
    var recipeGroupId : Int
    
    // modification의 종류에 따라 reset 코드가 달라진다.
    var modification : Modification
    enum Modification {
        case append
        case delegate
    }
}
