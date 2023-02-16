//
//  VendorManager.swift
//  SampleMacApp2
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

final class VendorManager : ObservableObject {
    static var shared = VendorManager()
    
    @Published var vendorDatas : [VendorData] = vendorDataSample
}

// 샘플 데이터
var vendorDataSample : [VendorData] = [
    VendorData(elementName: "감자", calculationUnit: "개", price: 1000, purchaseUnitMass: 10.0, vendorCategory: .coupang),
    VendorData(elementName: "체리", calculationUnit: "개", price: 7900, purchaseUnitMass: 400.0, vendorCategory: .coupang),
    VendorData(elementName: "바나나", calculationUnit: "개", price: 3590, purchaseUnitMass: 1500.0, vendorCategory: .coupang),
    VendorData(elementName: "초콜렛", calculationUnit: "개", price: 440, purchaseUnitMass: 120.0, vendorCategory: .coupang),
    VendorData(elementName: "가지", calculationUnit: "개", price: 330, purchaseUnitMass: 1110.0, vendorCategory: .coupang),
    VendorData(elementName: "마늘", calculationUnit: "개", price: 493, purchaseUnitMass: 106.0, vendorCategory: .coupang),
    VendorData(elementName: "대파", calculationUnit: "개", price: 12345, purchaseUnitMass: 10.0, vendorCategory: .coupang),
    VendorData(elementName: "오징어", calculationUnit: "개", price: 456, purchaseUnitMass: 1033.0, vendorCategory: .coupang)]
