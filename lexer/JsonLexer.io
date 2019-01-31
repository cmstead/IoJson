JsonLexer := Object clone\
    do(
        tokens ::= nil
        jsonParseable ::= nil
    )

JsonLexer init := method(
    tokens = JsonTokens clone
    jsonParseable = JsonParseable clone
)

JsonLexer setString := method(
    jsonString,

    jsonParseable setJsonString(jsonString)
)

JsonLexer lex := method(
    
    currentToken := ""

    tokenize := block(
        currentChar,

        if(
            JsonTokenHelper isSurroundingCharacter(currentChar),

            (
                tokens appendToken(currentToken)
                tokens appendToken(currentChar)

                currentToken = ""
            ),

            currentToken = currentToken .. currentChar
        )
    )

    jsonParseable foreach(tokenize);

    tokens appendToken(currentToken)

    return tokens getTokens()
)