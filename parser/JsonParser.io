JsonParser := Object clone\
    do(
        jsonAst ::= nil
    )

JsonParser init := method(
    jsonAst = JsonAstBuilder buildDocumentNode()
)

JsonParser parseTokens := method(
    jsonTokens, currentNode,

    jsonTokens foreach(
        currentToken,
        (
            tokenNode := JsonAstBuilder buildNodeFromToken(currentToken)
            currentNode appendChild(tokenNode)
        )
    )

    return currentNode
)

JsonParser parse := method(
    jsonTokens,

    if(
        jsonTokens size == 0,
        jsonAst,
        parseTokens(jsonTokens, jsonAst)
    )
)