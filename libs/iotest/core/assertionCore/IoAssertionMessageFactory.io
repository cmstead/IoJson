IoAssertionMessageFactory := Object clone \
do(
    messageTemplates := Map clone

    messageTemplates atPut("equalMessage", "Expected #{expected} but got #{actual}")
    messageTemplates atPut("notEqualMessage", "Expected #{expected} to not equal #{actual}")
)

IoAssertionMessageFactory buildMessageOnNilFactory := block(
    messageBuilder, failureMessage,

    return block(
        return if(
            failureMessage != nil,
            failureMessage,
            messageBuilder call()
        )
    )
)

IoAssertionMessageFactory messageBuilderFactory := method(
    template,

    return block(expected, actual, return block(template interpolate))
)

IoAssertionMessageFactory equalMessageBuilderFactory := method(
    return messageBuilderFactory(messageTemplates at("equalMessage"))
)

IoAssertionMessageFactory notEqualMessageBuilderFactory := method(
    return messageBuilderFactory(messageTemplates at("notEqualMessage"))
)

IoAssertionMessageFactory raisesExceptionMessageBuilderFactory := method(
    block(
        errorMessage,

        if(
            errorMessage == nil,
            "Expected block to raise an exception, but no exception was raised",
            "Expected block to raise an exception with message #{errorMessage}" interpolate
        )
    )
)
