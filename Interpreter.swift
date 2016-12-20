import Foundation

class Interpreter {
    func run(tuple:Tuple, tuples:[Tuple], symbols:SymbolsTable, debug:Bool, parent:AnyObject) {
        if debug {
            print("Tuple: (\(tuple.type), \(tuple.nextTrue), \(tuple.nextFalse))")
        }
    }
}
