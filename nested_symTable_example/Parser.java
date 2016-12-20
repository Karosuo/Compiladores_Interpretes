import java.util.ArrayList;

abstract public class Parser {
	protected ArrayList<Token> tokens;
	protected SymbolsTable symbolsTable;
	protected ArrayList<Tuple> tuples = new ArrayList<Tuple>();
	protected int tokenIndex = 0;
	protected int tokenIndexAux;
	protected boolean debug;

	abstract public boolean parse(ArrayList<Token> tokens, SymbolsTable symbolsTable, boolean debug);

	public ArrayList<Token> getTokens() {
		return tokens;
	}

	public SymbolsTable getSymbolsTable() {
		return symbolsTable;
	}

	public ArrayList<Tuple> getTuples() {
		return tuples;
	}

	protected boolean match(String name) {
        if (tokenIndex >= tokens.size())
            return false;
        
		if (tokens.get(tokenIndex).getType().getName().equals(name)) {
			tokenIndex++;
			
			if (debug)
				System.out.println("Match: " + name);

			return true;
		}

		return false;
	}
	
	protected int resetIndexes(int tokenIndex, int tupleIndex) {
	    this.tokenIndex = tokenIndex;
	    deleteTuples(tupleIndex, tuples.size());
	    return tuples.size();
	}

	protected void deleteTuples(int begin, int end) {
		int n = end - begin;
		
		for (int i=0; i<n; i++)
			tuples.remove(tuples.size()-1);
	}

	protected void buildTuple(String type, int beginToken, int endToken, int nextTrue, int nextFalse) {
		ArrayList<Token> elements = new ArrayList<Token>();

		for (int i=beginToken; i<endToken; i++)
			elements.add(tokens.get(i));

		//tuples.add(new Tuple(type, elements, beginToken, nextTrue, nextFalse));
		tuples.add(new Tuple(type, elements, nextTrue, nextFalse));
	}
}

