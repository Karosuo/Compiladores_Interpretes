import Foundation

/*** Grammar

<Programa> ::= <Expresiones> 
<Expresiones> ::= <Expresion> <Expresiones> 
<Expresiones> ::= <Expresion> 
<Expresion> ::= MAKE STRING <Valor> 
<Expresion> ::= MAKE STRING <Operacion> 
<Expresion> ::= <Comando> 
<Expresion> ::= <Comando> <Bloques> 
<Expresion> ::= <Comando> NUMBER 
<Expresion> ::= <Condicional> 
<Expresion> ::= <Ciclo> 
<Expresion> ::= <Avance> 
<Expresion> ::= <Operacion> 
<Expresion> ::= <Bloques> 
<Bloques> ::= LKEY <Bloque> <Bloques> RKEY 
<Bloques> ::= LKEY <Bloque> RKEY 
<Bloques> ::= LKEY <Expresiones> RKEY 
<Bloque> ::= LKEY <Expresiones> RKEY 
<Operacion> ::= NUMBER OPERADOR NUMBER 
<Operacion> ::= USE VARIABLE OPERADOR USE VARIABLE 
<Valor> ::= USE VARIABLE 
<Valor> ::= NUMERO 
<Valor> ::= STRING 
<Ciclo> ::= REPEAT NUMBER <Expresiones> 
<Condicional> ::= IF <Condicion> <Expresiones> 
<Condicional> ::= IFELSE <Condicion> <Expresiones> ELSE <Expresiones> 
<Condicion> ::= USE VARIABLE EQU USE VARIABLE 
<Condicion> ::= USE VARIABLE 
<Avance> ::= GO <Direccion> STEPS 
<Direccion> ::= FORWARD 
<Direccion> ::= BACKWARD 
<Comando> GO 
<Comando> REPEAT 
<Comando> FORWARD 
<Comando> BACKWARD 
<Comando> NOT 
<Comando> LEFT 
<Comando> RIGHT 
<Comando> STEPS 
<Comando> NEW 
<Comando> WORD 
<Comando> START 
<Comando> END 
<Comando> PENUP 
<Comando> PENDOWN 
<Comando> HOME 
<Comando> CLS 
<Comando> PRINT 
<Comando> BYE 
<Comando> REPCOUNT 
<Comando> IF 
<Comando> IFELSE 
<Comando> SIN 
<Comando> COS 
<Comando> MAKE 
<Comando> COLOR 

*/

class C:\Users\Rafael Karosuo\Documents\UABC\2016-2\Compiladores_iOS\MetaInterpreter\KLogoParser: Parser
	override init() {
		super.init()
	}

	override func parse(tokens:[Token], symbols: SymbolsTable, debug: Bool) -> Bool {
		super.parse(tokens, symbols:symbols, debug:debug)

		if Programa() {
			if tokenIndex == tokens.count {
				buildTuple("End", begin:0, end:0, nextTrue:0, nextFalse:0)
				return true
			}
		}

		return false
	}

	func Programa() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Programa> ::= <Expresiones> 

		if Expresiones() {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Expresiones() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Expresiones> ::= <Expresion> <Expresiones> 

		if Expresion() {
			if Expresiones() {
				return true
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresiones> ::= <Expresion> 

		if Expresion() {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Expresion() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Expresion> ::= MAKE STRING <Valor> 

		if match("MAKE") {
			if match("STRING") {
				if Valor() {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= MAKE STRING <Operacion> 

		if match("MAKE") {
			if match("STRING") {
				if Operacion() {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= <Comando> 

		if Comando() {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= <Comando> <Bloques> 

		if Comando() {
			if Bloques() {
				return true
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= <Comando> NUMBER 

		if Comando() {
			if match("NUMBER") {
				return true
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= <Condicional> 

		if Condicional() {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= <Ciclo> 

		if Ciclo() {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= <Avance> 

		if Avance() {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= <Operacion> 

		if Operacion() {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Expresion> ::= <Bloques> 

		if Bloques() {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Bloques() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Bloques> ::= LKEY <Bloque> <Bloques> RKEY 

		if match("LKEY") {
			if Bloque() {
				if Bloques() {
					if match("RKEY") {
						return true
					}
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Bloques> ::= LKEY <Bloque> RKEY 

		if match("LKEY") {
			if Bloque() {
				if match("RKEY") {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Bloques> ::= LKEY <Expresiones> RKEY 

		if match("LKEY") {
			if Expresiones() {
				if match("RKEY") {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Bloque() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Bloque> ::= LKEY <Expresiones> RKEY 

		if match("LKEY") {
			if Expresiones() {
				if match("RKEY") {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Operacion() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Operacion> ::= NUMBER OPERADOR NUMBER 

		if match("NUMBER") {
			if match("OPERADOR") {
				if match("NUMBER") {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Operacion> ::= USE VARIABLE OPERADOR USE VARIABLE 

		if match("USE") {
			if match("VARIABLE") {
				if match("OPERADOR") {
					if match("USE") {
						if match("VARIABLE") {
							return true
						}
					}
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Valor() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Valor> ::= USE VARIABLE 

		if match("USE") {
			if match("VARIABLE") {
				return true
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Valor> ::= NUMERO 

		if match("NUMERO") {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Valor> ::= STRING 

		if match("STRING") {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Ciclo() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Ciclo> ::= REPEAT NUMBER <Expresiones> 

		if match("REPEAT") {
			if match("NUMBER") {
				if Expresiones() {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Condicional() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Condicional> ::= IF <Condicion> <Expresiones> 

		if match("IF") {
			if Condicion() {
				if Expresiones() {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Condicional> ::= IFELSE <Condicion> <Expresiones> ELSE <Expresiones> 

		if match("IFELSE") {
			if Condicion() {
				if Expresiones() {
					if match("ELSE") {
						if Expresiones() {
							return true
						}
					}
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Condicion() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Condicion> ::= USE VARIABLE EQU USE VARIABLE 

		if match("USE") {
			if match("VARIABLE") {
				if match("EQU") {
					if match("USE") {
						if match("VARIABLE") {
							return true
						}
					}
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Condicion> ::= USE VARIABLE 

		if match("USE") {
			if match("VARIABLE") {
				return true
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Avance() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Avance> ::= GO <Direccion> STEPS 

		if match("GO") {
			if Direccion() {
				if match("STEPS") {
					return true
				}
			}
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Direccion() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Direccion> ::= FORWARD 

		if match("FORWARD") {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Direccion> ::= BACKWARD 

		if match("BACKWARD") {
			return true
		}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

	func Comando() -> Bool {
		let tokenIndexAux: Int = tokenIndex
		var tupleIndex: Int = tuples.count

		// <Comando> GO 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> REPEAT 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> FORWARD 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> BACKWARD 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> NOT 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> LEFT 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> RIGHT 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> STEPS 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> NEW 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> WORD 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> START 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> END 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> PENUP 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> PENDOWN 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> HOME 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> CLS 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> PRINT 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> BYE 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> REPCOUNT 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> IF 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> IFELSE 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> SIN 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> COS 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> MAKE 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)

		// <Comando> COLOR 

		return true
	}

		tupleIndex = resetIndexes(tokenIndexAux, tupleIndex:tupleIndex)
		return false
	}

}
