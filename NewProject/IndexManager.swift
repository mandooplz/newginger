//
//  IndexManager.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

final class IndexManager {
    // 1. 공유 프로퍼티
    static var shared = IndexManager()
    
    // 2. 인덱스
    var recipeBook : [String:Int] = [:]
    var elementBook : [String:Int] = [:]
    var unitBook : [String:Int] = [:]
    var elementUnitBook : [String:Int] = [:]
    var packageBook : [String:Int] = [:]
    var referenceBook : [String:Int] = [:]
    
    
    // 3. IndexManager 서버로부터 데이터 초기화
    
    // 4. 새로운 정보로 Dictionary 업데이트
    func fetchBook() { }
}
