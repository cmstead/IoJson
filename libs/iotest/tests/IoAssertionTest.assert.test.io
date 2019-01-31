ioTest testSuite("IoAssertion assert") \
    test(
        "raises an exception on failure",

        block(
            exception := try(
                IoAssertion assert(false, "Expected exception")
            )

            exception catch()

            IoAssertion assert(exception != nil, "An exception was not raised")
        )
    ) \
    test(
        "does not raise an exception on success",

        block(
            exception := try(
                IoAssertion assert(true, "Expecting no exception")
            )

            exception catch()

            IoAssertion assert(exception == nil, "An exception was raised")
        )
    ) \
    test(
        "raises exception provided by user",

        block(
            exceptionMessage := "User specified exception"

            exception := try(
                IoAssertion assert(false, exceptionMessage)
            )

            exception catch()

            IoAssertion assert(exception error == exceptionMessage, "User specified message not raised")
        )
    ) \
    test(
        "raises default exception when no message is specified",

        block(
            exception := try(
                IoAssertion assert(false)
            )

            exception catch()

            expectedMessage := "Expected true but got false"

            IoAssertion assert(exception error == expectedMessage, "Default message not raised")
        )
    )