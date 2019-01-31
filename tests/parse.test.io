ParseTestHelpers := Object clone

ParseTestHelpers evaluateJsonSource := method(
    jsonSource,

    lexer := JsonLexer clone
    lexer setString(jsonSource)

    jsonTokens := lexer lex()

    parser := JsonParser clone
    parser parse(jsonTokens)
)

ioTest testSuite("IoJson parse") \
    test(
        "parses an empty string and returns an empty document",

        block(
            jsonSource := ""
            expectedValue := 0

            jsonResult := ParseTestHelpers evaluateJsonSource(jsonSource)
            jsonBodySize := jsonResult getChildren() size

            IoAssertion assertEqual(expectedValue, jsonBodySize)
        )
    )\
    test(
        "parses a number and returns a document containing a number value node",

        block(
            jsonSource := "1234"
            expectedValue := 1234;

            jsonResult := ParseTestHelpers evaluateJsonSource(jsonSource)
            jsonBodyContent := jsonResult getChildren() at(0) getValue()

            IoAssertion assertEqual(expectedValue, jsonBodyContent);
        )
    )\
    test(
        "parses an object and returns a document containing a map node",

        block(
            jsonSource := "{}"
            expectedValue := "map"

            jsonResult := ParseTestHelpers evaluateJsonSource(jsonSource)
            jsonBodyNodeType := jsonResult getChildren() at(0) getNodeType()

            IoAssertion assertEqual(expectedValue, jsonBodyNodeType)
        )
    )\
    test(
        "parses an array and returns a document containing a list node",

        block(
            jsonSource := "[]"
            expectedValue := "list"

            jsonResult := ParseTestHelpers evaluateJsonSource(jsonSource)
            
            jsonBodyNode := jsonResult getChildren() at(0)
            jsonBodyNodeType := jsonBodyNode getNodeType()

            IoAssertion assertEqual(expectedValue, jsonBodyNodeType)
        )
    )