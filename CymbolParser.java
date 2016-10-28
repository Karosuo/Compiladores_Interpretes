import java.util.ArrayList;

/*** Grammar

<Programa> ::= <Expresiones> 
<Expresiones> ::= <Expresion> <Expresiones> 
<Expresiones> ::= <Expresion> 
<Expresion> ::= <Tipo> VARIABLE IGUAL <Valor> PUNTOYCOMA 
<Expresion> ::= <Tipo> VARIABLE PUNTOYCOMA 
<Expresion> ::= <Funcion> 
<Expresion> ::= <Bloques> 
<Expresion> ::= <Operacion> 
<Expresion> ::= <Invocacion> PUNTOYCOMA 
<Operacion> ::= <Valor> OPERADOR <Operacion> 
<Operacion> ::= <Valor> OPERADOR <Valor> PUNTOYCOMA 
<Bloques> ::= LKEY <Bloque> <Bloques> RKEY 
<Bloques> ::= LKEY <Bloque> RKEY 
<Bloque> ::= LKEY <Expresiones> RKEY 
<Invocacion> ::= VARIABLE LPARENTESIS <ParametrosOut> RPARENTESIS 
<Invocacion> ::= VARIABLE LPARENTESIS RPARENTESIS 
<Funcion> ::= <Tipo> VARIABLE LPARENTESIS <ParametrosIn> RPARENTESIS LKEY <Expresiones> RETURN <Valor> PUNTOYCOMA RKEY 
<Funcion> ::= <Tipo> VARIABLE LPARENTESIS RPARENTESIS LLAVEI <Expresiones> RETURN <Valor> PUNTOYCOMA RKEY 
<Funcion> ::= VOID VARIABLE LPARENTESIS <ParametrosIn> RPARENTESIS LKEY <Expresiones> RKEY 
<Funcion> ::= VOID VARIABLE LPARENTESIS RPARENTESIS LKEY <Expresiones> RKEY 
<ParametrosIn> ::= <ParametroIn> COMA <ParametrosIn> 
<ParametrosIn> ::= <ParametroIn> 
<ParametroIn> ::= <Tipo> VARIABLE 
<ParametrosOut> ::= VARIABLE COMA <ParametrosOut> 
<ParametrosOut> ::= <ParametroOut> 
<ParametroOut> ::= VARIABLE 
<Valor> ::= VARIABLE 
<Valor> ::= NUMERO 
<Valor> ::= <Invocacion> 
<Tipo> ::= INT 
<Tipo> ::= FLOAT 

*/

public class CymbolParser extends Parser {
	public boolean parse(ArrayList<Token> tokens, SymbolsTable symbolsTable, boolean debug) {
		this.tokens = tokens;
		this.symbolsTable = symbolsTable;
		this.debug = debug;

		if (debug) {
			System.out.println("********** Grammar rules **********");
			System.out.println();
		}

		if (Programa())
			if (tokenIndex == tokens.size()) {
				buildTuple("End", 0, 0, 0, 0);

				if (debug) {
					System.out.println();
					System.out.println("Syntax is correct");
					System.out.println();
				}

				return true;
			}

		if (debug) {
			System.out.println();
			System.out.println("Syntax is incorrect");
			System.out.println();
		}

		return false;
	}

	private boolean Programa() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Programa> ::= <Expresiones> 

		if (debug) {
			System.out.println("<Programa> ::= <Expresiones> ");
		}

		if (Expresiones())
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Expresiones() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Expresiones> ::= <Expresion> <Expresiones> 

		if (debug) {
			System.out.println("<Expresiones> ::= <Expresion> <Expresiones> ");
		}

		if (Expresion())
			if (Expresiones())
				return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Expresiones> ::= <Expresion> 

		if (debug) {
			System.out.println("<Expresiones> ::= <Expresion> ");
		}

		if (Expresion())
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Expresion() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Expresion> ::= <Tipo> VARIABLE IGUAL <Valor> PUNTOYCOMA 

		if (debug) {
			System.out.println("<Expresion> ::= <Tipo> VARIABLE IGUAL <Valor> PUNTOYCOMA ");
		}

		if (Tipo())
			if (match("VARIABLE"))
				if (match("IGUAL"))
					if (Valor())
						if (match("PUNTOYCOMA"))
							return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Expresion> ::= <Tipo> VARIABLE PUNTOYCOMA 

		if (debug) {
			System.out.println("<Expresion> ::= <Tipo> VARIABLE PUNTOYCOMA ");
		}

		if (Tipo())
			if (match("VARIABLE"))
				if (match("PUNTOYCOMA"))
					return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Expresion> ::= <Funcion> 

		if (debug) {
			System.out.println("<Expresion> ::= <Funcion> ");
		}

		if (Funcion())
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Expresion> ::= <Bloques> 

		if (debug) {
			System.out.println("<Expresion> ::= <Bloques> ");
		}

		if (Bloques())
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Expresion> ::= <Operacion> 

		if (debug) {
			System.out.println("<Expresion> ::= <Operacion> ");
		}

		if (Operacion())
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Expresion> ::= <Invocacion> PUNTOYCOMA 

		if (debug) {
			System.out.println("<Expresion> ::= <Invocacion> PUNTOYCOMA ");
		}

		if (Invocacion())
			if (match("PUNTOYCOMA"))
				return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Operacion() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Operacion> ::= <Valor> OPERADOR <Operacion> 

		if (debug) {
			System.out.println("<Operacion> ::= <Valor> OPERADOR <Operacion> ");
		}

		if (Valor())
			if (match("OPERADOR"))
				if (Operacion())
					return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Operacion> ::= <Valor> OPERADOR <Valor> PUNTOYCOMA 

		if (debug) {
			System.out.println("<Operacion> ::= <Valor> OPERADOR <Valor> PUNTOYCOMA ");
		}

		if (Valor())
			if (match("OPERADOR"))
				if (Valor())
					if (match("PUNTOYCOMA"))
						return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Bloques() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Bloques> ::= LKEY <Bloque> <Bloques> RKEY 

		if (debug) {
			System.out.println("<Bloques> ::= LKEY <Bloque> <Bloques> RKEY ");
		}

		if (match("LKEY"))
			if (Bloque())
				if (Bloques())
					if (match("RKEY"))
						return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Bloques> ::= LKEY <Bloque> RKEY 

		if (debug) {
			System.out.println("<Bloques> ::= LKEY <Bloque> RKEY ");
		}

		if (match("LKEY"))
			if (Bloque())
				if (match("RKEY"))
					return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Bloque() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Bloque> ::= LKEY <Expresiones> RKEY 

		if (debug) {
			System.out.println("<Bloque> ::= LKEY <Expresiones> RKEY ");
		}

		if (match("LKEY"))
			if (Expresiones())
				if (match("RKEY"))
					return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Invocacion() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Invocacion> ::= VARIABLE LPARENTESIS <ParametrosOut> RPARENTESIS 

		if (debug) {
			System.out.println("<Invocacion> ::= VARIABLE LPARENTESIS <ParametrosOut> RPARENTESIS ");
		}

		if (match("VARIABLE"))
			if (match("LPARENTESIS"))
				if (ParametrosOut())
					if (match("RPARENTESIS"))
						return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Invocacion> ::= VARIABLE LPARENTESIS RPARENTESIS 

		if (debug) {
			System.out.println("<Invocacion> ::= VARIABLE LPARENTESIS RPARENTESIS ");
		}

		if (match("VARIABLE"))
			if (match("LPARENTESIS"))
				if (match("RPARENTESIS"))
					return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Funcion() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Funcion> ::= <Tipo> VARIABLE LPARENTESIS <ParametrosIn> RPARENTESIS LKEY <Expresiones> RETURN <Valor> PUNTOYCOMA RKEY 

		if (debug) {
			System.out.println("<Funcion> ::= <Tipo> VARIABLE LPARENTESIS <ParametrosIn> RPARENTESIS LKEY <Expresiones> RETURN <Valor> PUNTOYCOMA RKEY ");
		}

		if (Tipo())
			if (match("VARIABLE"))
				if (match("LPARENTESIS"))
					if (ParametrosIn())
						if (match("RPARENTESIS"))
							if (match("LKEY"))
								if (Expresiones())
									if (match("RETURN"))
										if (Valor())
											if (match("PUNTOYCOMA"))
												if (match("RKEY"))
													return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Funcion> ::= <Tipo> VARIABLE LPARENTESIS RPARENTESIS LLAVEI <Expresiones> RETURN <Valor> PUNTOYCOMA RKEY 

		if (debug) {
			System.out.println("<Funcion> ::= <Tipo> VARIABLE LPARENTESIS RPARENTESIS LLAVEI <Expresiones> RETURN <Valor> PUNTOYCOMA RKEY ");
		}

		if (Tipo())
			if (match("VARIABLE"))
				if (match("LPARENTESIS"))
					if (match("RPARENTESIS"))
						if (match("LLAVEI"))
							if (Expresiones())
								if (match("RETURN"))
									if (Valor())
										if (match("PUNTOYCOMA"))
											if (match("RKEY"))
												return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Funcion> ::= VOID VARIABLE LPARENTESIS <ParametrosIn> RPARENTESIS LKEY <Expresiones> RKEY 

		if (debug) {
			System.out.println("<Funcion> ::= VOID VARIABLE LPARENTESIS <ParametrosIn> RPARENTESIS LKEY <Expresiones> RKEY ");
		}

		if (match("VOID"))
			if (match("VARIABLE"))
				if (match("LPARENTESIS"))
					if (ParametrosIn())
						if (match("RPARENTESIS"))
							if (match("LKEY"))
								if (Expresiones())
									if (match("RKEY"))
										return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Funcion> ::= VOID VARIABLE LPARENTESIS RPARENTESIS LKEY <Expresiones> RKEY 

		if (debug) {
			System.out.println("<Funcion> ::= VOID VARIABLE LPARENTESIS RPARENTESIS LKEY <Expresiones> RKEY ");
		}

		if (match("VOID"))
			if (match("VARIABLE"))
				if (match("LPARENTESIS"))
					if (match("RPARENTESIS"))
						if (match("LKEY"))
							if (Expresiones())
								if (match("RKEY"))
									return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean ParametrosIn() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <ParametrosIn> ::= <ParametroIn> COMA <ParametrosIn> 

		if (debug) {
			System.out.println("<ParametrosIn> ::= <ParametroIn> COMA <ParametrosIn> ");
		}

		if (ParametroIn())
			if (match("COMA"))
				if (ParametrosIn())
					return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <ParametrosIn> ::= <ParametroIn> 

		if (debug) {
			System.out.println("<ParametrosIn> ::= <ParametroIn> ");
		}

		if (ParametroIn())
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean ParametroIn() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <ParametroIn> ::= <Tipo> VARIABLE 

		if (debug) {
			System.out.println("<ParametroIn> ::= <Tipo> VARIABLE ");
		}

		if (Tipo())
			if (match("VARIABLE"))
				return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean ParametrosOut() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <ParametrosOut> ::= VARIABLE COMA <ParametrosOut> 

		if (debug) {
			System.out.println("<ParametrosOut> ::= VARIABLE COMA <ParametrosOut> ");
		}

		if (match("VARIABLE"))
			if (match("COMA"))
				if (ParametrosOut())
					return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <ParametrosOut> ::= <ParametroOut> 

		if (debug) {
			System.out.println("<ParametrosOut> ::= <ParametroOut> ");
		}

		if (ParametroOut())
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean ParametroOut() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <ParametroOut> ::= VARIABLE 

		if (debug) {
			System.out.println("<ParametroOut> ::= VARIABLE ");
		}

		if (match("VARIABLE"))
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Valor() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Valor> ::= VARIABLE 

		if (debug) {
			System.out.println("<Valor> ::= VARIABLE ");
		}

		if (match("VARIABLE"))
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Valor> ::= NUMERO 

		if (debug) {
			System.out.println("<Valor> ::= NUMERO ");
		}

		if (match("NUMERO"))
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Valor> ::= <Invocacion> 

		if (debug) {
			System.out.println("<Valor> ::= <Invocacion> ");
		}

		if (Invocacion())
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}

	private boolean Tipo() {
		int tokenIndexAux = tokenIndex;
		int tupleIndex = tuples.size();

		// <Tipo> ::= INT 

		if (debug) {
			System.out.println("<Tipo> ::= INT ");
		}

		if (match("INT"))
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);

		// <Tipo> ::= FLOAT 

		if (debug) {
			System.out.println("<Tipo> ::= FLOAT ");
		}

		if (match("FLOAT"))
			return true;

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex);
		return false;
	}
}
