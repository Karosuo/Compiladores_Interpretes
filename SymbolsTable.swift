import Foundation

class SymbolsTable {
    var symbols: [Symbol] = []
    
    init() {}
    
    func addSymbol(name:String, type:String, value:Double) {
        for symbol in symbols {
            if symbol.name == name {
                return;
            }
        }
        
        symbols.append(Symbol(name:name, type:type, value:value))
    }
    
    func getSymbol(name:String) -> Symbol? {
        for symbol in symbols {
            if symbol.name == name {
                return symbol;
            }
        }
        
        return nil
    }
}