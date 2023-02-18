//
//  Capsule.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/16.
//

import Foundation

struct Capsule : Identifiable {
    // 1. Capsule의 id, LocationNum, Plan에서의 위치
    var locationNum : Int
    var id : Int { locationNum }
    
    // 2. User가 설정하는 Capsule Category
    // 만약 User가 2개의 Category를 선택하면 2개의 Capsule을 만든다.
    var category : RecipeCategory
    
    enum RecipeCategory {
        case SD
        case SO
        case SN
        case ME
    }
}
