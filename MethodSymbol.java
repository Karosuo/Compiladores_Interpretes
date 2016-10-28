public class MethodSymbol extends Symbol implements Scope{
	private ArrayList<VariableSymbol> orderedArgs;
	
	public MethodSymbol(String name){
		super(name);
	}
	
}
