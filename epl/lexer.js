var lex = function (input) {
	var isOperator = function (c) { return /[+\-*\/\^%=(),\<\>]/.test(c); },
		isDigit = function (c) { return /[0-9]/.test(c); },
		isWhiteSpace = function (c) { return /\s/.test(c); },
		isIdentifier = function (c) { return typeof c === "string" && !isOperator(c) && !isDigit(c) && !isWhiteSpace(c); },
		isIdentifierExtended = function(c) { return /\(\)/.test(c) || isIdentifier(c) || isDigit(c); }
		isString = function (c) { return /[^"]/.test(c); },
		isOperatorWord = function(c) { var cc=c.substr(0,2); if (cc=="<=" || cc==">=" || cc=="==" || cc=="<>") return [null,cc]; return /^(and|not|or)\s/i.exec(c); }
		
	var tokens = [], c, i = 0;
	var advance = function () { return c = input[++i]; };
	var addToken = function (type, value) {
		tokens.push({
			type: type,
			value: value
		});
	};
	while (i < input.length) {
		c = input[i];
		if (isWhiteSpace(c)) {
			advance();
		} else if (w=isOperatorWord(input.substr(i))) {	// this goes before isOperator because < is a subset of <=
			addToken((w[1]).toLowerCase());	// first match in [1]
			i += (w[1]).length;
		}
		else if (isOperator(c)) {
			addToken(c);
			advance();
		}
		else if (isDigit(c)) {
			var num = c;
			while (isDigit(advance())) num += c;
			if (c === ".") {
				do num += c; while (isDigit(advance()));
			}
			num = parseFloat(num);
			if (!isFinite(num)) throw "Number is too large or too small for a 64-bit double.";
			addToken("number", num);
		}
		else if (c == '\"') {
			var idn = "";
			// TODO: Handle "" in strings to represent "
			while (isString(advance())) idn += c;
			++i;	// skip the end quote
			addToken("string", idn);
		}
		else if (isIdentifier(c)) {
			var idn = c;
			// TODO: Support brackets and other expression elements inside ()
			while (isIdentifierExtended(advance())) idn += c;
			addToken("identifier", idn);
		}
		else throw "Unrecognized token.";
	}
	addToken("(end)");
	return tokens;
};