import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public abstract class Lexer {
	protected ArrayList<TokenType> tokenTypes = new ArrayList<TokenType>();
	protected ArrayList<Token> tokens = new ArrayList<Token>();
	protected SymbolsTable symbolsTable = new SymbolsTable();

	abstract protected void initializeTokenTypes();

	private String readSourceFile(String fileName) {
		String input = "";

		try {
			FileReader reader = new FileReader(fileName);
			int character;

			while ((character = reader.read()) != -1)
				input += (char) character;

			reader.close();
			return input;
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	abstract protected boolean isIdentifier(String s);
	
	public ArrayList<Token> getTokens() {
		return tokens;
	}

	public SymbolsTable getSymbolsTable() {
		return symbolsTable;
	}

	public String lex(String input, boolean inputIsFile, boolean debug) {
		initializeTokenTypes();

		StringBuffer tokenPatternsBuffer = new StringBuffer();

		for (TokenType tt : tokenTypes)
			tokenPatternsBuffer.append(String.format("|(?<%s>%s)", tt.getName(), tt.getPattern()));

		Pattern tokenPatterns = Pattern.compile(new String(tokenPatternsBuffer.substring(1)));

		if (inputIsFile)
			input = readSourceFile(input);
		
		if (input == null)
			return "No source file or empty file";

		Matcher matcher = tokenPatterns.matcher(input);

		while (matcher.find()) {
			for (TokenType tt: tokenTypes) {
				if (matcher.group("SPACE") != null)
					continue;
				else if (matcher.group(tt.getName()) != null) {
					if (tt.getName().equals("ERROR")) {
						return "Invalid token: " + matcher.group(tt.getName());
					}

					tokens.add(new Token(tt, matcher.group(tt.getName())));

					/**If it was a variable, add it to the sym table
					 * But commented since the sym table will be filled on Parser*/
					//if (isIdentifier(tt.getName()))
						//symbolsTable.addSymbol(matcher.group(tt.getName()), tt.getName(), 0);

					break;
				}
			}
		}
		
		if (debug) {
			System.out.println("********** Tokens **********");
			System.out.println();
			
			for (Token t: tokens)
				System.out.println("(" + t.getType().getName() + "," + t.getData() + ")");
		
			System.out.println();
		}
		
		return "";
	}
}
