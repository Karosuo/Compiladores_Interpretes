public interface Scope{
	public String getScopeName();
	public String getEnclosingScope();
	public void define(Symbol sym);
	public Symbol resolve(String name);
}
