JsonAstNode := Object clone\
    do(
        nodeType ::= nil
        value ::= nil
        children ::= nil
    )

JsonAstNode init := method(
    self children = List clone
)


JsonAstNode setNodeType := method(
    nodeType,

    self nodeType = nodeType
)

JsonAstNode getNodeType := method(
    return self nodeType
)


JsonAstNode setValue := method(
    value,

    self value = value
)

JsonAstNode getValue := method(
    return value
)


JsonAstNode appendChild := method(
    childNode,

    children append(childNode)
)

JsonAstNode getChildren := method(
    return children
)