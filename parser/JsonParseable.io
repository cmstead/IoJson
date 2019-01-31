JsonParseable := Object clone

JsonParseable init := method(
    self jsonString := nil
    self charPointer := 0
)

JsonParseable setJsonString := method(
    jsonStringValue,

    if(
        jsonString == nil,
        jsonString = jsonStringValue,
        Exception raise("Cannot change value of JSON string once it is set")
    )
)

JsonParseable getCharAt := method(
    index,

    jsonString exSlice(index, index + 1)
)

JsonParseable getNextChar := method(
    charPointer = charPointer + 1
    getCharAt(charPointer)
)

JsonParseable foreach := method(
    action,

    charPointer = 0
    currentChar := getCharAt(charPointer)
    
    while(
        currentChar != "",
        
        action call(currentChar)
        currentChar = getNextChar(charPointer)
    ) 
)