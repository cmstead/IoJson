JsonTokens := Object clone\
    do(
        tokens ::= nil
    )

JsonTokens init := method(
    tokens = List clone
)

JsonTokens appendToken := method(
    token,

    if(
        token != "",
        tokens append(token)
    )
)

JsonTokens getTokens := method(
    return tokens
)