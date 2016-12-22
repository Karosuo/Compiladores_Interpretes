import Foundation

extension String {
    func rangeFromNSRange(nsRange:NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(nsRange.location, limit: utf16.endIndex)
        let to16 = from16.advancedBy(nsRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self) {
            return from ..< to
        }
        return nil
    }
}

class Lexer {
    var tokenTypes: [TokenType] = []
    var tokens: [Token] = []
    var symbolsTable: SymbolsTable = SymbolsTable()
    
    init() {}
    
    func initializeTokenTypes() {}
    
    func isIdentifier(s:String) -> Bool {
        return true
    }
    
    func readSourceFile(pathFileName:String) -> String? {
        var content: String
        
        do {
            content = try String(contentsOfFile:pathFileName, encoding:NSUTF8StringEncoding)
            return content;
        } catch _ as NSError {
            return nil
        }
    }

    func lex(input:String, sourceInFile:Bool, debug:Bool) -> String {
        initializeTokenTypes()
        
        var inputProgram: String! = input
        var pattern: String = "";
        var first: Bool = true
        
        let regex: NSRegularExpression
        let matches: [NSTextCheckingResult]
        
        if sourceInFile {
            inputProgram = readSourceFile(input)
        }
    
        for tt in tokenTypes {
            if !first {
                pattern.appendContentsOf("|")
            }
            else {
                first = false;
            }
            
            pattern.appendContentsOf(tt.pattern)
        }
       
        do {
            regex = try NSRegularExpression(pattern:pattern, options:.CaseInsensitive)
            matches = regex.matchesInString(inputProgram, options:NSMatchingOptions(rawValue:0), range:NSMakeRange(0, inputProgram.characters.count))
            
            for match in matches {
                let data = inputProgram.substringWithRange(inputProgram.rangeFromNSRange(match.range)!)
                
                for tt in tokenTypes {
                    let r: NSRegularExpression =  try NSRegularExpression(pattern:tt.pattern, options:.CaseInsensitive)
                    let m = r.matchesInString(data, options:NSMatchingOptions(rawValue:0), range:NSMakeRange(0, data.characters.count))
                    
                    if m.count > 0 {
                        let d = data.substringWithRange(data.rangeFromNSRange((m.first?.range)!)!)
                    
                        if data == d {
                            
                            if tt.name == "ERROR" {
                                return d;
                            }
                            
                            tokens.append(Token(type:tt, data:data))
                    
                            if isIdentifier(tt.name) {
                                symbolsTable.addSymbol(data, type:tt.name, value:0.0)
                            }
                        
                            break
                        }
                    }
                }
            }
        }
        catch {
            return "Regular expression error"
        }
        
        if debug {
            for t in tokens {
                print("Token: (\(t.type.name) , \(t.data))")
            }
            
            for s in symbolsTable.symbols {
                print("Symbol: (\(s.name), \(s.type), \(s.value))")
            }
        }
        
        return ""
    }
}
