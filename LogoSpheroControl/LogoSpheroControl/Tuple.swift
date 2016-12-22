import Foundation

class Tuple {
    var type: String
    var elements: [Token] = []
    var nextTrue: Int
    var nextFalse: Int
    
    init(type:String, elements:[Token], nextTrue:Int, nextFalse:Int) {
        self.type = type
        self.elements = elements
        self.nextTrue = nextTrue
        self.nextFalse = nextFalse
    }
}