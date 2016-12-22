import Foundation

class KLogoExecution {
    var lexer: Lexer!
    var parser: Parser!
    var interpreter: Interpreter!
    
    func execute(pathFilename:String, source:Bool, debug:Bool, parent:AnyObject) -> String {
        lexer = KLogoLexer()
        parser = KLogoParser()
        interpreter = KLogoInterpreter()
        
        var exeResult : String
        let LexResult = lexer.lex(pathFilename, sourceInFile: source /* true = input in file, false = input in string */, debug: debug)
        
        if LexResult != "" {
            return LexResult;
        }
        
        if lexer.tokens.isEmpty {
            exeResult = "Error: there's no tokens to parse."
        }
            if parser.parse(lexer.tokens, symbols:lexer.symbolsTable, debug:debug) {
                interpreter.run(parser.tuples[0], tuples:parser.tuples, symbols:parser.symbols, debug:debug, parent:parent)
                exeResult = "End of execution."
            }
            else {
                exeResult = "Syntax error."
            }
        
        return exeResult
    }

}
