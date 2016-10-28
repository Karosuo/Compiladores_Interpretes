public class TestCymbol
{
	public static void main(String args[])
	{
		Lexer lex = new CymbolLexer();
		lex.lex("test.cymbol",true,true);
		Parser par = new CymbolParser();
		par.parse(lex.getTokens(),lex.getSymbolsTable(),true);
	}
}
