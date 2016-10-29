public interface Scope{
	public String getScopeName();
	//public String getEnclosingScope(); /**Now it has nested levels, needs to return Scope*/
	public Scope getEnclosingScope();
	public void define(Symbol sym);
	public Symbol resolve(String name);
}
