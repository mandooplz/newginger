//
//  VendorData.swift
//  SampleMacApp2
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

struct VendorData : Codable, Identifiable {
    // 1. id
    var id = UUID()
    
    // 2. elementName
    var elementName : String
    var calculationUnit : String
    
    var price : Int
    var purchaseUnitMass : Double

    // 3. vendorCategory
    var vendorCategory : VendorCategory
    enum VendorCategory : String, Codable {
        case coupang = "쿠팡"
        case kurly = "마켓 컬리"
        case ssg = "SSG"
        case naver = "네이버"
    }
}
