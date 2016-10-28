public class MethodSymbol extends Symbol implements Scope{
	Map<String, Symbol> symbols = new HashMap<String, Symbol>(); //This is the local symbols table
	private boolean debug = false;
	private Scope enclosingScope;//Keeps track of the parent scopes/symbol_tables , to be able to do recursivity
	//No need of current scope, since the instance of SymbolsTable has it
	
	public MethodSymbol(String name, Scope enclosingScope){
		super(name);
		this.enclosingScope = enclosingScope; //Save the parent scope to do recursivity
		this.currentScope = this; //This is the current scope
	}
	
	public String getScopeName(){return String.format("Local method %s()", this.getName());} //Returns the kind of scope and it's name, since it's a method
	
	public String getEnclosingScope(){return this.enclosingScope;}
	
	public void setDebugFlag(boolean flag){this.debug = flag;}
	
	public void define(Symbol sym){symbols.put(sym.name,sym);
			if(this.debug)
				System.out.println(String.format("Variable defined: %s\n in %s scope",sym.getName(), this.getScopeName()));
		}
	
	public Symbol resolve(String name){
		if(this.debug)
			System.out.println(String.format("\nFinding %s variable in %s scope...", name, this.getScopeName()));
		Symbol s = this.symbols.get(name); //Look in this scope
		if(s!=null)return s; //if it's in this scope return it
		//As it wasn't on this scope, go to check on parent scope
		//MethodSymbol will always have a parent, at least the SymbolsTable, which is the GLOBAL SCOPE
		//If there's more levels, they'll check on each other's parent until get to GLOBAL SCOPE and check there
		//If it's found return it, otherwise, they'll get to global scope and global scope will return NULL if not found
		return this.enclosingScope.resolve(name); 
	}
	
	public String toString(){return getScopeName() + ":" + symbols;}
	
	public void undefine(String name){
			if(this.debug)
				System.out.println(String.format("\nVariable undefined: %s from %s scope\n",name, this.getScopeName()));
			this.symbols.remove(name);
		}

	
}
