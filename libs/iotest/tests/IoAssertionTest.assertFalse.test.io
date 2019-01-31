ioTest testSuite("IoAssertion assertFalse") \
    test(
        "raises an exception on true",

        block(
            expectedException := "Expected exception"

            exception := try(
                IoAssertion assertFalse(true, expectedException)
            )

            exception catch()

            IoAssertion assert(exception error == expectedException, "The correct exception was not raised")
        )
    ) \
    test(
        "does not raise an exception on false",

        block(
            exception := try(
                IoAssertion assertFalse(false, "Expecting no exception")
            )

            exception catch()

            IoAssertion assert(exception == nil, "An exception was raised")
        )
    )