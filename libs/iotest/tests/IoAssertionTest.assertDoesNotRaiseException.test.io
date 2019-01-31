ioTest testSuite("IoAssertion assertDoesNotRaiseException") \
    test(
        "raises an exception when provided block raises an exception",

        block(
            expectedException := "Exception should be raised"

            exception := try(
                IoAssertion assertDoesNotRaiseException(
                    block(Exception raise("Exception Raised")),
                    expectedException
                )
            )

            exception catch()

            IoAssertion assertEqual(exception error, expectedException, "The correct exception was not raised")
        )
    ) \
    test(
        "succeeds when test block does not raise exception",

        block(
            expectedException := "Exception should not be raised"

            exception := try(
                IoAssertion assertDoesNotRaiseException(
                    block("No exception here!"),
                    expectedException
                )
            )

            exception catch()

            IoAssertion assert(exception == nil, "An exception was raised: #{exception}" interpolate)
        )
    )