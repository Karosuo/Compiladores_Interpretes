import Foundation

class C:\Users\Rafael Karosuo\Documents\UABC\2016-2\Compiladores_iOS\MetaInterpreter\KLogoLexer: Lexer {
	override func initializeTokenTypes() {
		tokenTypes.append(TokenType(name:"IF" pattern:"IF"))
		tokenTypes.append(TokenType(name:"IFELSE" pattern:"IFELSE"))
		tokenTypes.append(TokenType(name:"ELSE" pattern:"~"))
		tokenTypes.append(TokenType(name:"GO" pattern:"GO"))
		tokenTypes.append(TokenType(name:"REPEAT" pattern:"REPEAT"))
		tokenTypes.append(TokenType(name:"FORWARD" pattern:"FORWARD"))
		tokenTypes.append(TokenType(name:"BACKWARD" pattern:"BACKWARD"))
		tokenTypes.append(TokenType(name:"NOT" pattern:"NOT"))
		tokenTypes.append(TokenType(name:"LEFT" pattern:"LEFT"))
		tokenTypes.append(TokenType(name:"RIGHT" pattern:"RIGHT"))
		tokenTypes.append(TokenType(name:"UNITS" pattern:"UNITS"))
		tokenTypes.append(TokenType(name:"NEW" pattern:"NEW"))
		tokenTypes.append(TokenType(name:"WORD" pattern:"WORD"))
		tokenTypes.append(TokenType(name:"START" pattern:"START"))
		tokenTypes.append(TokenType(name:"END" pattern:"END"))
		tokenTypes.append(TokenType(name:"PENUP" pattern:"PENUP"))
		tokenTypes.append(TokenType(name:"PENDOWN" pattern:"PENDOWN"))
		tokenTypes.append(TokenType(name:"HOME" pattern:"HOME"))
		tokenTypes.append(TokenType(name:"CLS" pattern:"CLEARSCREEN"))
		tokenTypes.append(TokenType(name:"PRINT" pattern:"PRINT"))
		tokenTypes.append(TokenType(name:"BYE" pattern:"BYE"))
		tokenTypes.append(TokenType(name:"REPCOUNT" pattern:"REPCOUNT"))
		tokenTypes.append(TokenType(name:"SIN" pattern:"SIN"))
		tokenTypes.append(TokenType(name:"COS" pattern:"COS"))
		tokenTypes.append(TokenType(name:"MAKE" pattern:"MAKE"))
		tokenTypes.append(TokenType(name:"STRING" pattern:""[a-zA-Z]+"))
		tokenTypes.append(TokenType(name:"USE_VARIABLE" pattern:":[a-zA-Z]+"))
		tokenTypes.append(TokenType(name:"NUMBER" pattern:"-?[0-9]+(\\.([0-9]+))?"))
		tokenTypes.append(TokenType(name:"EQU" pattern:"="))
		tokenTypes.append(TokenType(name:"LKEY" pattern:"\\["))
		tokenTypes.append(TokenType(name:"RKEY" pattern:"\\]"))
		tokenTypes.append(TokenType(name:"OPERATOR" pattern:"[*|/|+|-]"))
	}

	override func isIdentifier(s: String) -> Bool {
		if s == "IDENTIFIER" {
			return true
		}

		return false
	}

}
