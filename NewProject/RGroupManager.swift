//
//  RGroupManager.swift
//  SampleMacApp2
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation

final class RGroupManager : ObservableObject {
    static var shaerd = RGroupManager()
    
    @Published var newRecipes : [Recipe] = []
    var newRecipeNum : Int { newRecipes.count }
    
    @Published var RGs : [RecipeGroup] = []
    @Published var changedRGs : [RecipeGroup] = []
    @Published var newRGs : [RecipeGroup] = []
    
    // Recipe와 RecipeGroup 데이터를 서버에서 가져옵니다.
    func updateRecipe() { }
    func updateRG() { }
}
