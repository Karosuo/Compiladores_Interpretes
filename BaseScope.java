public class BaseScope implements Scope{
	/**Defines the functionality to the */
	private Map<String, Symbol> symbols = new HashMap<String, Symbol>();
	private boolean debug = false;
	private String enclosing_scope; //Parent scope
	private String current_scope; //Current scope
	
	public void setDebugFlag(boolean flag){this.debug = flag;}
	
	public BaseScope() {initTypeSystem();}	
	protected void initTypeSystem(){
		/**Startup all the built in types*/
		define(new BuiltInTypeSymbol("int"));
		define(new BuiltInTypeSymbol("float"));
		define(new BuiltInTypeSymbol("void"));
		this.enclosing_scope = null; //Starts with global, which doesn't have parent
		this.current_scope = new String("global"); //Start global scope
	}
	
	public String getScopeName(){return this.current_scope;}
	
	public String getEnclosingScope(){return this.enclosing_scope;}
	
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
