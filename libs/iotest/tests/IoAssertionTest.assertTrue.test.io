ioTest testSuite("IoAssertion assertTrue") \
    test(
        "raises an exception on false",

        block(
            expectedException := "Expected exception"

            exception := try(
                IoAssertion assertTrue(false, expectedException)
            )

            exception catch()

            IoAssertion assert(exception error == expectedException, "The correct exception was not raised")
        )
    ) \
    test(
        "does not raise an exception on true",

        block(
            exception := try(
                IoAssertion assertTrue(true, "Expecting no exception")
            )

            exception catch()

            IoAssertion assert(exception == nil, "An exception was raised")
        )
    )