import Foundation

class Token {
    var type: TokenType
    var data: String
    
    init(type:TokenType, data:String) {
        self.type = type
        self.data = data
    }
}
