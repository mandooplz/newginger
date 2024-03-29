//
//  StartManager.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import Foundation
import AppKit

final class StartManager : ObservableObject {
    static var shared = StartManager()
    
    // 1. 프로퍼티
    @Published var recipes : [Recipe] = recipeSample
    @Published var ingredients : [Ingredient] = []
    @Published var methods : [Method] = []
    
    var recipeSet : Set<Recipe> { Set(recipes) }
    var methodSet : Set<Method> { Set(methods) }
    var elementSet : Set<Element> {
        // Ingredient에서 ElementSet 추출
        return [Element(id: 1, name: "")]
    }
    var elementUnitSet : Set<ElementUnit> {
        // Ingredient에서 ElementUnitSet 추출
        return [ElementUnit(element: "", unit: "")]
    }
    var unitSet : Set<Unit> {
        // Ingredient에서 UnitSet 추출
        return [Unit(unitId: 1, unit: "")]
    }
    var referenceSet : Set<RecipeReference> {
        return [RecipeReference(name: "")]
    }
    
    // 2. JSON 준비
    static func importJSON(_ completeFunc: @escaping (URL?)->Void) -> Void {
        let openPanel = NSOpenPanel()
        openPanel.message = "JSON 파일을 골라주세요"
        
        openPanel.begin { response in
            if response == .OK {
                let url = openPanel.url
                completeFunc(url)
            }
        }
    }
    static func loadJSON<T : Decodable>(_ file: Data) -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: file)
        } catch {
            fatalError("Couldn't parse \(file) as \(T.self):\n\(error)")
        }
    }

    // 3. 5개의 Set을 업로드한다. -> 5개의 Set를 어떻게 구분, 어차피 Set를 바로 전송하기만 하면 되니까 상관없지 않을까?
    func uploadIndex() async {
        // EndPoint 정의
        let endPoint = Endpoint.base
        
        // 통신 수행 -> 나중에 Recipe.self 바꿀 것
        let result = await NetworkManager.shared.sendRequest(endpoint: endPoint, responseModel: Recipe.self)
          switch result {
          case .success(let res):
              print(res)
          case .failure(let err):
              print(err.customMessage)
          }
        
        // DB에 업로드가 끝난 뒤 IndexManager를 통해 Book을 업데이트한다.
        InfoManager.shared.fetchBook()
    }
    func insertIndex() {
        let mg = InfoManager.shared
        // methods에 전부 id 추가
        methods = methods.map({ m in
            var new = Method(recipe_name: m.recipe_name, number: m.number, method: m.method)
            new.recipe_id = mg.recipeBook[m.recipe_name]
            return new
        })
        
        // ingredients에 전부 id 추가
        ingredients = ingredients.map({ i in
            var new = Ingredient(recipe_name: i.recipe_name, position: i.position, element_name: i.element_name, amount: i.amount, ingredient_unit: i.ingredient_unit, unifiedMass: 0.0)
            new.recipe_id = mg.recipeBook[i.recipe_name]
            new.element_id = mg.elementBook[i.element_name]
            new.element_unit_id = mg.elementUnitBook[i.ingredient_unit]
            return new
        })
    }

    // 5. Method, Ingredient를 업로드한다.
    func upload() async {
        // 데이터 준비
        guard let methodData = try? JSONEncoder().encode(methods) else { return }
        guard let ingredientData = try? JSONEncoder().encode(ingredients) else { return }
        
        // 엔드포인트
        let endPoint = Endpoint.base
        
        // method 전송
        async let firstresult = NetworkManager.shared.sendRequest(endpoint: endPoint, responseModel: Recipe.self, data: methodData)
        switch await firstresult {
        case .success(let res):
            print(res)
        case .failure(let err):
            print(err.customMessage)
        }
        
        // ingredient 전송
        async let secondresult = NetworkManager.shared.sendRequest(endpoint: endPoint, responseModel: Recipe.self, data: ingredientData)
        switch await secondresult {
        case .success(let res):
            print(res)
        case .failure(let err):
            print(err.customMessage)
        }
        
    }
}


// 샘플 데이터
var recipeSample : [Recipe] = [
    Recipe(recipe_name: "김치찌개", category: "찌개류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "어묵조림", category: "조림류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "데친두부김치쌈", category: "쌈류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "감자채볶음", category: "볶음류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "부추겉절이", category: "김치류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "청양고추강된장찌개", category: "국물류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "부추무침", category: "나물 및 무침류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "배추속대무침", category: "나물 및 무침류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "연근칩", category: "구이류", yield: 4, reference: "1001레시피"),
    Recipe(recipe_name: "쪽파오징어부침", category: "부침류", yield: 4, reference: "1001레시피")]
