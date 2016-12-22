import UIKit

class KLogoInterpreter : Interpreter{
    override func run(tuple:Tuple, tuples:[Tuple], symbols:SymbolsTable, debug:Bool, parent:AnyObject) {
        super.run(tuple, tuples:tuples, symbols:symbols, debug:debug, parent:parent)
        
        switch tuple.type {
        default: break
        }
    }
}
