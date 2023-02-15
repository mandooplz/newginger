//
//  EGroupManager.swift
//  SampleMacApp2
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

final class EGroupManager : ObservableObject {
    static var shared = EGroupManager()
    
    @Published var newElements : [Element] = []
    var newElementNum : Int { newElements.count }
    
    @Published var changedEGs : [ElementGroup] = []
    @Published var newEGs : [ElementGroup] = []
    
    func updateElement() { }
    func updateEG() { }
}
