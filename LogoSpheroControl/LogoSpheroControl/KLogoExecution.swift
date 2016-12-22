import Foundation

class C:\Users\Rafael Karosuo\Documents\UABC\2016-2\Compiladores_iOS\MetaInterpreter\KLogoExecution {
	var lexer: Lexer!
	var parser: Parser!
	var interpreter: Interpreter!

	func execute(pathFilename:String, source:Bool, debug:Bool, parent:AnyObject) -> String {
		lexer = C:\Users\Rafael Karosuo\Documents\UABC\2016-2\Compiladores_iOS\MetaInterpreter\KLogoLexer()
		parser = C:\Users\Rafael Karosuo\Documents\UABC\2016-2\Compiladores_iOS\MetaInterpreter\KLogoParser()
		interpreter = C:\Users\Rafael Karosuo\Documents\UABC\2016-2\Compiladores_iOS\MetaInterpreter\KLogoInterpreter()

		result = lexer.lex(pathFilename, sourceInFile: source /* true = input in file, false = input in string */, debug: debug)

		if result != "" {
			return result;
		}

		if lexer.tokens.isEmpty {
			return "Error: there's no tokens to parse."

		if parser.parse(lexer.tokens, symbols:lexer.symbolsTable, debug:debug) {
			interpreter.run(parser.tuples[0], tuples:parser.tuples, symbols:parser.symbols, debug:debug, parent:parent)
		}
		else {
			return "Syntax error."
		}

		return "End of execution."
	}
}
