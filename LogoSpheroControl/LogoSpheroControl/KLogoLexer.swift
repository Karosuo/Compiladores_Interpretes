import Foundation

class KLogoLexer : Lexer{

    override func initializeTokenTypes() {
        super.tokenTypes.append(TokenType(name:"IF", pattern:"IF"))
        super.tokenTypes.append(TokenType(name:"IFELSE" , pattern:"IFELSE"))
        super.tokenTypes.append(TokenType(name:"ELSE" , pattern:"~"))
        super.tokenTypes.append(TokenType(name:"GO" , pattern:"GO"))
        super.tokenTypes.append(TokenType(name:"REPEAT" , pattern:"REPEAT"))
        super.tokenTypes.append(TokenType(name:"FORWARD" , pattern:"FORWARD"))
        super.tokenTypes.append(TokenType(name:"BACKWARD" , pattern:"BACKWARD"))
        super.tokenTypes.append(TokenType(name:"NOT" , pattern:"NOT"))
        super.tokenTypes.append(TokenType(name:"LEFT" , pattern:"LEFT"))
        super.tokenTypes.append(TokenType(name:"RIGHT" , pattern:"RIGHT"))
        super.tokenTypes.append(TokenType(name:"STEPS" , pattern:"STEPS"))
        super.tokenTypes.append(TokenType(name:"NEW" , pattern:"NEW"))
        super.tokenTypes.append(TokenType(name:"WORD" , pattern:"WORD"))
        super.tokenTypes.append(TokenType(name:"START" , pattern:"START"))
        super.tokenTypes.append(TokenType(name:"END" , pattern:"END"))
        super.tokenTypes.append(TokenType(name:"PENUP" , pattern:"PENUP"))
        super.tokenTypes.append(TokenType(name:"PENDOWN" , pattern:"PENDOWN"))
        super.tokenTypes.append(TokenType(name:"HOME" , pattern:"HOME"))
        super.tokenTypes.append(TokenType(name:"CLS" , pattern:"CLEARSCREEN"))
        super.tokenTypes.append(TokenType(name:"PRINT" , pattern:"PRINT"))
        super.tokenTypes.append(TokenType(name:"BYE" , pattern:"BYE"))
        super.tokenTypes.append(TokenType(name:"REPCOUNT" , pattern:"REPCOUNT"))
        super.tokenTypes.append(TokenType(name:"SIN" , pattern:"SIN"))
        super.tokenTypes.append(TokenType(name:"COS" , pattern:"COS"))
        super.tokenTypes.append(TokenType(name:"MAKE" , pattern:"MAKE"))
        super.tokenTypes.append(TokenType(name:"STRING" , pattern:"\"[a-zA-Z]+"))
        super.tokenTypes.append(TokenType(name:"USE_VARIABLE" , pattern:":[a-zA-Z]+"))
        super.tokenTypes.append(TokenType(name:"NUMBER" , pattern:"?[0-9]+(\\.([0-9]+))?"))
        super.tokenTypes.append(TokenType(name:"EQU" , pattern:"="))
        super.tokenTypes.append(TokenType(name:"LKEY" , pattern:"\\["))
        super.tokenTypes.append(TokenType(name:"RKEY" , pattern:"\\]"))
        super.tokenTypes.append(TokenType(name:"OPERATOR" , pattern:"[*|/|+|-]"))
    }
    
    override func isIdentifier(s: String) -> Bool {
        if s == "IDENTIFIER" {
            return true
        }
        
        return false
    }
    
}
