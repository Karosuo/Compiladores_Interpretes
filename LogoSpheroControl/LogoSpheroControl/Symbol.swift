import Foundation

class Symbol {
    var name: String
    var type: String
    var value: Double
    
    init(name:String, type:String, value:Double) {
        self.name = name
        self.type = type
        self.value = value
    }
}