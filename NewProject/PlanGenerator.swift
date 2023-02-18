import Foundation
import Accelerate

final class PlanGenerator {
    
    var recipes : [Int8:[Int:[ElementLocationMass]]] = [:] // key1 : recipeCategory, key2 : recipe_id, key3 : element_id,, value : unified_mass
    var elements : [Element] = []
    var elementPurchaseUnitMass : [Int:[Double]] = [:] // key : element_id, value : purchaseUnitMass (정렬된 상태!!!)
}

extension PlanGenerator {
    // (capsule의 위치 index = locationNum, recipeCategoryId, recipeId)
    typealias PlanGroupIndexes = Array<(Int, Int8, Int)>
    // (LocationNum, Plan에서 Element의 LocationNum에서 unifiedMass)
    typealias LocationAndMass = Array<(Int, Double)>
    // key : recipe의 index, value : [recipe에 사용되는 element의 index]
    typealias RecipeElementIndexes = [Int:[Int]]
    
    // 4. PlanGroup 경우의 수
    func getPlanGroups(_ capsules : [[Capsule]]) -> [PlanGroupIndexes] {
        // [[Capsule]] ->
        return []
    }
    
    func getPlans(_ planGroup : PlanGroupIndexes) -> [Plan] {
        // 첫번째 과정(Element별 위치, mass 준비)
        // [ElementLocationMass]의 리스트 = [element_id:[(locationNum,unifedMass)]]
        let ElementLocationMassList =
            planGroup.map { locationNum, recipeCategoryId, recipeId in
            // location과 recipe를 알 수 있다.
            guard let recipes = recipes[recipeCategoryId], let recipe = recipes[recipeId] else {
                print("레시피(\(recipeId)에 해당하는 재료가 없습니다.")
                return Array<ElementLocationMass>()
            }
                return recipe
        }.flatMap { element_id in
            element_id
        }
        
        // [element_id:[(LocationNum,Mass)]] => [Int:[(Int,Double)]]
        let firstCalInfo = Dictionary(grouping: ElementLocationMassList, by: { $0.id })
            .mapValues { list in
                return list.map {$0.locationMass}[0]
            }
        
        // 두번째 과정 = element_id별 locationMass의 set를 이용한다.
        Array<Int>(firstCalInfo.keys).map { elementId in
            // element_id에 해당하는 [(locationNum, unifiedMass)]를 찾는다.
            let locationMasses = firstCalInfo[elementId]!.sorted(by : { $0.0 < $1.0 } )
            
            // purchase를 반복하기 위한 indexA => [purchaseUnitMass]
            let sortedPUM = elementPurchaseUnitMass[elementId]!.sorted(by: { $0 < $1 })
            
            // Bridge를 만들기 위한 반복 시작 ,첫 Bridge를 만든다.

            var lists : [[Bridge]] = []
            let (firstLocation, firstMass) = locationMasses.first!

            sortedPUM.forEach { purchaseUnitMass in
                if purchaseUnitMass > firstMass {
                    // 여기서 Bridge를 만든다.
                    var newBridge = Bridge()
                    newBridge.ingredients.append((firstLocation, elementId, firstMass))
                    newBridge.purchaseUnitMass.append(purchaseUnitMass)
                    lists.append([newBridge])
                } else {
                    return }
            }
            
            // 첫번째 제거
            locationMasses.dropFirst()
            
            // 두번째부터 반복 시작
            var locationMassesCounter : Int = 0
            locationMasses.forEach { location, mass in
                // 카운터 증가
                defer { locationMassesCounter += 1 }
                
                // lists를 map한다.
                let leftMass = lists.map { bridges in
                    let totalMass = bridges.last!.ingredients.reduce(0.0) { $0 + $1.2}
                    let totalPUM = bridges.last!.purchaseUnitMass.reduce(0.0) { $0+$1 }
                    return totalPUM-totalMass
                 }
                
                // leftMass와 다음 mass를 비교하여 부족하면 purcahseUnitMass를 추가한다.
                var idx : Int = 0
                // 남은 재료>mass이면
                leftMass.forEach { leftMass in
                    defer { idx += 1 }
                    // 남은 재료>mass이면 기존의 Bridge에 프로퍼티 추가
                    if leftMass>=mass {
                        let lastidx = lists[idx].count-1
                        lists[idx][lastidx].ingredients.append((location, elementId, mass))
                    } else {
                    // 남은 재료<mass이면 새로운 Bridge생성, mass보다 큰 PUM으로만 Bridge 생성
                    // 이때 마지막이라면 mass보다 큰 PUM 중 가장 작은 PUM으로만 Bridge를 만든다.
                        if locationMassesCounter == locationMasses.count-1 {
                            var newBridge = Bridge()
                            let pum = sortedPUM.filter { $0 > mass }.first!
                            newBridge.ingredients.append((location, elementId, mass))
                            newBridge.purchaseUnitMass.append(pum)

                        } else {
                            sortedPUM.filter { $0 > mass }.forEach { pum in
                                var newBridge = Bridge()
                                newBridge.ingredients.append((location, elementId, mass))
                                newBridge.purchaseUnitMass.append(pum)
                                lists[idx].append(newBridge)
                            }
                        }
                        
                    }
                }
                
                
                //
            }
        }
        
        return []
    }
    
    // Capsule -> PlanGroupIndex에 사용되는 카르테시안 곱 함순
    @inlinable
    static func cartesianProduct(_ arrays : [[Int]]) {
        var counter = 0
        var listidCounts = arrays.map {
            let id = counter
            counter += 1
            return (id, $0.count) }

        // 첫번째를 지운다.
        listidCounts.removeFirst()

        var first : [[Int]] = [[]]
        // 반복하기 전 first의 초기값을 만든다.
        first = arrays[0].map { num in
            return [num]
        }

        // (arrayId = 1, count = 3) 부터 시작, (2,4)가 들어간다.
        listidCounts.forEach { (arrayId, count) in
            // first = [[1],[2]], 이때 beforeElement = [1]
            let second = first.flatMap { beforeElement in
                var array : [[Int]] = []
                Array(0..<count).forEach { idx in
                    var a = beforeElement
                    a.append(arrays[arrayId][idx])
                    array.append(a)
                }
                return array
                // 반환값은 [[1,3], [1,4], [1,5]]
            }
            first = second
        }
        print(first.count)
        print(first)
    }
}

extension PlanGenerator {
    // vendorData
    func getVendorData() { print("서버에서 VendorData를 받아와 반환합니다.")}
    // RecipeData
    func getRecipeData() { print("서버에서 RecipeData를 받아와 ")}
}
