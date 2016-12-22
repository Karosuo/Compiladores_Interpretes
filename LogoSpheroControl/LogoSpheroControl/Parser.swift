import Foundation

class Parser {
    var tokens: [Token] = []
    var symbols: SymbolsTable = SymbolsTable()
    var tuples: [Tuple] = []
    var tokenIndex = 0
    var debug: Bool = true
    
    init() {}
    
    func parse(tokens:[Token], symbols: SymbolsTable, debug: Bool) -> Bool {
        self.tokens = tokens
        self.symbols = symbols
        self.debug = debug
        
        return true
    }
    
    func match(name:String) -> Bool {
        if tokenIndex >= tokens.count {
            return false
        }
        
        let t: Token = tokens[tokenIndex]
        
        if t.type.name == name {
            tokenIndex += 1
            
            if debug {
                print("Match: \(name)")
            }
            
            return true
        }
        
        return false
    }
    
    func resetIndexes(tokenIndex:Int, tupleIndex:Int) -> Int {
        self.tokenIndex = tokenIndex
        deleteTuples(tupleIndex, end:tuples.count)
        return tuples.count
    }
    
    func deleteTuples(begin:Int, end:Int) {
        let n:Int = end - begin
        
        for _ in 0..<n {
            tuples.removeAtIndex(tuples.count - 1)
        }
    }
    
    func buildTuple(type:String, begin:Int, end:Int, nextTrue:Int, nextFalse:Int) {
        var elements: [Token] = []
        
        for i in begin..<end {
            elements.append(tokens[i])
        }
        
        tuples.append(Tuple(type:type, elements:elements, nextTrue:nextTrue, nextFalse:nextFalse))
    }
}