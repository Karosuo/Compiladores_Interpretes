import java.util.*;

public class SymbolsTable implements Scope{
	Map<String, Symbol> symbols = new HashMap<String, Symbol>(); //This is the global symbols table
	private boolean debug = false;
	private Scope currentScope; //Keeps track of the current local (or global if no local) symbol table
	private Scope enclosingScope; //Keeps track of the parent scopes/symbol_tables , to be able to do recursivity
	
	
	public void setDebugFlag(boolean flag){this.debug = flag;}
	
	public SymbolsTable() {
		this.currentScope = this; //this object is the current scope
		this.enclosingScope = null; //Symbol table is the the root scope
		initTypeSystem(); //Use define of this object, which in the first time will also be the currentScope, but no need to use that redirection
	}	
	protected void initTypeSystem(){
		define(new BuiltInTypeSymbol("int"));
		define(new BuiltInTypeSymbol("float"));
		define(new BuiltInTypeSymbol("void"));
	}
	
	public void pushScope(Scope newScope){
		this.currentScope = newScope; //newSCope already has the enclosingScope defined
		if (debug)
			System.out.println(String.format("Entering to %s scope", this.currentScope.getScopeName()));//Anounce who's the new currentScope
	}
	
	public void popScope(){
		this.currentScope = this.currentScope.getEnclosingScope(); //Get the parent scope
		
		if(this.currentScope == null){
			this.currentScope = this; //If no parent scope, means that it's the root
		}
		if(debug)
			System.out.println(String.format("Returning to %s scope", this.currentScope.getScopeName())); //Annouce to which scope are returning
	}
	
	public String getScopeName(){return "Global";}
	
	public String getEnclosingScope(){return this.enclosingScope;}
	
	public void define(Symbol sym){symbols.put(sym.name,sym);
			if(this.debug)
				System.out.println(String.format("Variable defined: %s in global scope\n",sym.getName()));
		}
	
	public Symbol resolve(String name){
			if(this.debug)
				System.out.println(String.format("\nFinding %s variable in global scope...", name));
			return symbols.get(name);			
		}
	
	public String toString(){return getScopeName() + ":" + symbols;}
	
	public void undefine(String name){
			if(this.debug)
				System.out.println(String.format("\nVariable undefined: %s from global scope\n",name));
			this.symbols.remove(name);
		}
}
