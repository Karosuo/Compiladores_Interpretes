public class CymbolLexer extends Lexer {
	protected void initializeTokenTypes() {
		tokenTypes.add(new TokenType("INT", "int"));
		tokenTypes.add(new TokenType("FLOAT", "float"));
		tokenTypes.add(new TokenType("VARIABLE", "[a-zA-Z]+"));
		tokenTypes.add(new TokenType("NUMERO", "-?[0-9]+(\\.([0-9]+))?"));
		tokenTypes.add(new TokenType("IGUAL", "="));
		tokenTypes.add(new TokenType("PUNTOYCOMA", ";"));
		tokenTypes.add(new TokenType("COMA", ","));
		tokenTypes.add(new TokenType("VOID", "void"));
		tokenTypes.add(new TokenType("LKEY", "\\{"));
		tokenTypes.add(new TokenType("RKEY", "\\}"));
		tokenTypes.add(new TokenType("LPARENTESIS", "\\("));
		tokenTypes.add(new TokenType("RPARENTESIS", "\\)"));
		tokenTypes.add(new TokenType("RETURN", "return"));
		tokenTypes.add(new TokenType("OPERADOR", "[*|/|+|-]"));
		tokenTypes.add(new TokenType("SPACE", "[ \t\f\r\n]+"));
		tokenTypes.add(new TokenType("ERROR", ".+"));
	}

	protected boolean isIdentifier(String s) {
		if (s.equals("VARIABLE"))
			return true;

		return false;
	}
}

