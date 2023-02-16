import Foundation

struct RecipeGroup : Identifiable, Codable {
    // StartContainer의 id, name
    var id : Int
    var name : String
    
    var mainCategory : String
    var subCategory : String
    
    var ECs : [EC] = []
    var SCEs : [SCE] = []
}
// ElementGroup의 Coonec
enum RGConnection : Codable {
    case vertical(type : String)
    case horizontal(type : String)
}
