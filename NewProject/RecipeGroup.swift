import Foundation

struct RecipeGroup : Identifiable, Codable {
    // StartContainer의 id, name
    var id : Int
    var name : String
    
    var mainCategory : String
    var subCategory : String
    
    var appended : [Recipe] = []
    var delegated : [Recipe] = []
}
