//
//  ElementGroup.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

struct ElementGroup : Identifiable, Codable {
    var id : Int
    var name : String
    
    var mainCategory : String
    var subCategory : String
    
    var ECs : [EC] = []
    var SCEs : [SCE] = []
    
    // Gingerone에서 수정하는 값, 이때 Int는 모두 Elementid값
    var modifedCount : Int?
    var changedECindexs : [Int] = []
    var changedSCEindexs : [Int] = []
}

struct EC : Codable, Identifiable {
    // 서버에서 받아오는 값
    var id : Int { EId }
    var EId : Int
    var name : String
    var connDirection : String
    var connType : String
    var ECEs : [ECE] = []
    
    // Gingerone에서 추가하는 값
    var modifedCount : Int?
    var changedECEs : [Int] = []
}

struct ECE : Codable, Identifiable {
    var id : Int { EId }
    var EId : Int
    var name : String
    var connDirection : String
    var connType : String
    
    // Gingerone에서 추가하는 값
    var modifedCount : Int?
}

struct SCE : Codable, Identifiable {
    var id : Int { EId }
    var EId : Int
    var name : String
    var connDirection : String
    var connType : String
    
    // Gingerone에서 추가하는 값
    var modifedCount : Int?
}

// MARK: Modified Element
// Me : ElementGroup의 수정정보
struct ME : Identifiable {
    // 사용자는 ME를 보고 수정사항을 Reset할 수 있다.
    // insertedEid -> EG에 추가한 Eid
    var insertedEid : Int
    var insertedEName : String
    // modifedEGid -> 수정이 이루어진 ElementGroupId
    var modifiedEGindex : Int? = nil
    // insertedPlace -> SCE, EC, ECE 중 하나
    var insertedPlace : String? = nil
    // insertedindex -> [EC, ECE, SCE]의 리스트에서의 index
    // (1) EC를 추가한 경우 : insertedECindex
    // (2) ECE를 추가한 경우 : insertedECindex, insertedECEindex
    // (3) SCE를 추가한 경우 : insertedSCEindex
    var insertedECindex : Int? = nil
    var insertedECEindex : Int? = nil
    var insertedSCEindex : Int? = nil
    
    // Table에서 사용하기 위한
    var id : Int { insertedEid }
    var idStr : String { String(insertedEid)}
}
