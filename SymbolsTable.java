import java.util.*;

public class SymbolsTable implements Scope{
	Map<String, Symbol> symbols = new HashMap<String, Symbol>();
	private boolean debug = false;
	
	public void setDebugFlag(boolean flag){this.debug = flag;}
	
	public SymbolsTable() {initTypeSystem();}	
	protected void initTypeSystem(){
		define(new BuiltInTypeSymbol("int"));
		define(new BuiltInTypeSymbol("float"));
	}
	
	public String getScopeName(){return "global";}
	
	public String getEnclosingScope(){return null;}
	
	public void define(Symbol sym){symbols.put(sym.name,sym);
			if(this.debug)
				System.out.println(String.format("Variable defined: %s\n",sym.getName()));
		}
	
	public Symbol resolve(String name){
			if(this.debug)
				System.out.println(String.format("\nFinding %s variable...", name));
			return symbols.get(name);			
		}
	
	public String toString(){return getScopeName() + ":" + symbols;}
	
	public void undefine(String name){
			if(this.debug)
				System.out.println(String.format("\nVariable undefined: %s\n",name));
			this.symbols.remove(name);
		}
}
