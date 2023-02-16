//
//  EGroupManager.swift
//  SampleMacApp2
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

final class EGroupManager : ObservableObject {
    static var shared = EGroupManager()
    
    @Published var newElements : [Element] = elementSample
    var newElementNum : Int { newElements.count }
    
    @Published var EGs : [ElementGroup] = EGSample
    @Published var changedEGs : [ElementGroup] = []
    @Published var newEGs : [ElementGroup] = []
    
    func updateElement() { }
    func updateEG() { }
}

var elementSample : [Element] = [Element(id: 1, name: "감자"),
                                 Element(id: 2, name: "고구마"),
                                 Element(id: 3, name: "호박"),
                                 Element(id: 4, name: "닭"),
                                 Element(id: 5, name: "삼겹살")]

var EGSample : [ElementGroup] = [
    ElementGroup(id: 1, name: "마늘", mainCategory: "농산물", subCategory: "근채류"),
    ElementGroup(id: 2, name: "감자", mainCategory: "농산물", subCategory: "감자류"),
    ElementGroup(id: 3, name: "고등어", mainCategory: "수산물", subCategory: "어류"),
    ElementGroup(id: 4, name: "꼬막", mainCategory: "수산물", subCategory: "패류")]
