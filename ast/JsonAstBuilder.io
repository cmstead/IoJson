JsonAstBuilder := Object clone\
    do(
        tokenToNode := list(
            list(
                block(token, token == "{"),
                list("map", block(token, nil))
            ),
            list(
                block(token, token == "["),
                list("list", block(token, nil))
            ),
            list(
                block(token, true),
                list("value", block(token, token asNumber))
            )
        )
    )

JsonAstBuilder buildNode := method(
    nodeType, nodeValue,

    documentNode := JsonAstNode clone
    documentNode setNodeType(nodeType)
    documentNode setValue(nodeValue)

    return documentNode
)

JsonAstBuilder buildDocumentNode := method(
    return buildNode("document", nil)
)

JsonAstBuilder getNodeTypeFromDefinition := method(
    nodeDefinition,

    nodeDefinition at(1) at(0)
)

JsonAstBuilder getValueTransformationFromDefinition := method(
    nodeDefinition,

    nodeDefinition at(1) at(1)
)

JsonAstBuilder buildNodeFromToken := method(
    token,

    nodeDefinition := tokenToNode \
        select(nodeDef, nodeDef at(0) call(token))\
        at(0)
    
    nodeType := getNodeTypeFromDefinition(nodeDefinition)
    nodeValueTransformation := getValueTransformationFromDefinition(nodeDefinition);

    buildNode(nodeType, nodeValueTransformation call(token))
)