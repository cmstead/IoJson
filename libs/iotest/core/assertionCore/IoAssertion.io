IoAssertion := Object clone \
do(
    buildMessageOnNilFactory := IoAssertionMessageFactory buildMessageOnNilFactory

    equalMessageBuilderFactory := IoAssertionMessageFactory equalMessageBuilderFactory()
    notEqualMessageBuilderFactory := IoAssertionMessageFactory notEqualMessageBuilderFactory()

    equal := IoAssertionComparatorFactory equal
    notEqual := IoAssertionComparatorFactory notEqual

    verifyAndRaise := method(
        verification, messageBuilder,

        if(
            verification call() != true,
            Exception raise(messageBuilder call())
        )
    )

    inverse := method(
        predicate,

        return block(
            result := predicate call()
            return result != true
        )
    )

    exceptionCheckFactory := method(
        testBlock, expectedMessage,

        return block(
            exception := try(testBlock call())
            exception catch()

            errorMessageMatches := block(
                (expectedMessage == nil) or \
                (exception error == expectedMessage)
            )

            return (exception != nil) and (errorMessageMatches call())
        )
    )
)

IoAssertion assertEqual := method(
    expected, actual, failureMessage,

    messageBuilder := equalMessageBuilderFactory call(expected, actual)
    buildMessageOnNil := buildMessageOnNilFactory call(messageBuilder, failureMessage)

    verifyAndRaise(equal call(expected, actual), buildMessageOnNil)
)

IoAssertion assertNotEqual := method(
    expected, actual, failureMessage,

    messageBuilder := notEqualMessageBuilderFactory call(expected, actual)
    buildMessageOnNil := buildMessageOnNilFactory call(messageBuilder, failureMessage)

    verifyAndRaise(notEqual call(expected, actual), buildMessageOnNil)
)

IoAssertion assertRaisesException := method(
    testBlock, expectedMessage, failureMessage,

    isExceptionRaised := exceptionCheckFactory(testBlock, expectedMessage)

    verifyAndRaise(isExceptionRaised, block(failureMessage))
)

IoAssertion assertDoesNotRaiseException := method(
    testBlock, failureMessage,

    noExceptionIsRaised := inverse(exceptionCheckFactory(testBlock, nil))

    verifyAndRaise(noExceptionIsRaised, block(failureMessage))
)

IoAssertion assertTrue := method(
    actual, failureMessage,

    assertEqual(true, actual, failureMessage)
)

IoAssertion assertFalse := method(
    actual, failureMessage,

    assertEqual(false, actual, failureMessage)
)

IoAssertion assert := method(
    actual, failureMessage,

    assertTrue(actual, failureMessage)
)
