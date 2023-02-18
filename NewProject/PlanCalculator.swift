//
//  PlanCalculator.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/16.
//

import Foundation

final class PlanCalculator {
    var shared = PlanCalculator()
    
    // 1. 계산에 필요한 데이터를 받아 반환하는 함수
    func getCalData() { print("서버에서 Cal를 받아와 반환합니다.")}

    // 2. Plan을 받아서 Plan Score를 반환하는 함수
    func getPlanScore(_ plan : Plan) -> Double { return 10.0 }
}

//struct CalData : Codable {
//    // 1. UsedRate 계산에 사용되는 Data
//        // 1-1. Element_id, Vendor_Element_id, Purchase_Unit_Mass -> 따로 구조체를 만들어야 한다.
//    var elementId : [Int] = []
//    var purchaseUnitMass : [Int] = []
//
//    // 2. Distance 계산에 사용되는 Data
//        // Element별 MADP가 필요하다. PlanGroup에서 Plan을 생성할 때 이용한다.
//
//    // 3. A 계산에 사용되는 Data
//        //
//}
