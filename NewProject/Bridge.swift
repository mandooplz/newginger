//
//  Bridge.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/16.
//

import Foundation

struct Bridge {
    // 우리가 넣어야 하는 데이터
    var ingredients : [(Int, Int, Double)] = [] // (locationNum, element_id, unifedMass)
    var purchaseUnitMass : [Double] = []
    
    
    var totalPurchaseUnitMass : Double {
        return self.purchaseUnitMass.reduce(0.0) { $0 + $1 }
    }
    
    var StartPoint : Double {
        if ingredients.count <= 1 {
            return 0.0
        } else {
            return Double(ingredients.sorted(by: {$0.0 < $1.0}).first!.0)
        }
        
        
    }
    var FinishPoint : Double{
        Double(ingredients.sorted(by: {$0.0 < $1.0}).last!.0)
        
    }
    
    // 계산을 위한 Property
    let packageId : Int = 0
    var MADP : Double = 0
    var MSTP : Double = 0
    
    
    // f(usedRate)를 계산
    var verifiedUsedRate : Double {
        /// usedRate 계산 무조건 0이상, 1이하
        let usedRate : Double = ingredients.reduce(0.0) { $0 + $1.2 } / purchaseUnitMass[0]
        /// usedRate가 0.5보다 작은 경우 음수처리, userRate가 0.5보다 큰 경우
        return (usedRate <= 0.5) ? -abs(1.0-usedRate) : usedRate
    }
    
    // distacne 구하기
    var distance : Double {
        (MADP <= StartPoint) ? FinishPoint - MADP : FinishPoint - StartPoint
        
    }
    // A 구하기
    var A : Double {
        /// x값을 구한다.
        let x : Double = distance/MSTP
        /// x<1일 때는 (1.1)^(x-1) 그래프의 y값을 A로 정한다, x>1일 때는 e^(x) 그래프의 y값을 A로 정한다.
        return (x <= 1) ? pow(1.1, x-1) : exp(x-1)
    }
    var bridgeScore : Double { verifiedUsedRate/pow(distance, A) }
}
