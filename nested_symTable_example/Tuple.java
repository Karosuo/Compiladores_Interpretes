import java.util.ArrayList;

public class Tuple {
	private String type;
	private ArrayList<Token> elements;
	private int nextTrue, nextFalse;

	public Tuple(String type, ArrayList<Token> elements, int nextTrue, int nextFalse) {
		this.type = type;
		this.elements = elements;
		this.nextTrue = nextTrue;
		this.nextFalse = nextFalse;
	}

	public String getType() {
		return type;
	}
	
	public Token getElement(int i) {
		if (i >= 0 && i < elements.size())
			return elements.get(i);
		
		return null;
	}
	
	public int size() {
		if (elements != null)
			return elements.size();
		
		return 0;
	}

	public int getNextTrue() {
		return nextTrue;
	}
	
	public void setNextTrue(int nt) {
		nextTrue = nt;
	}

	public int getNextFalse() {
		return nextFalse;
	}

	public void setNextFalse(int nf) {
		nextFalse = nf;
	}

	public String toString() {
		return type + ", " + elements + ", " + ", " + nextTrue + ", " + nextFalse;
	}
}
