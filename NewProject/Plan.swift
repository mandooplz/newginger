import Foundation

// 1. PlanGroup은 가능한 모든 레시피의 조합을 나타낸다.
struct PlanGroup {
    var baseRecipes : [Int:Recipe] = [:]
    var unifiedPlanGroup : [Int:[Int]] = [:]
    
    // unifiedE를 보고 가능한 Bridge 인스턴스의 조합을 만든다.
    // 이 조합에 따라 Plan 인스턴스를 plans에 append한다.(반복)
    func makePlans() -> Void { }

}


struct Plan {
    var bridges : [Bridge] = []
    var planScore : Int?
}





