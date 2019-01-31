ioTest testSuite("IoAssertion assertRaisesException") \
    test(
        "raises an exception when provided block does not raise an exception",

        block(
            expectedException := "Expected exception"

            exception := try(
                IoAssertion assertRaisesException(
                    block("No exception here."),
                    nil,
                    expectedException
                )
            )

            exception catch()

            IoAssertion assertEqual(exception error, expectedException, "The correct exception was not raised")
        )
    ) \
    test(
        "raises an exception when provided block raises exception with wrong message",

        block(
            expectedException := "Expected exception"

            exception := try(
                IoAssertion assertRaisesException(
                    block(Exception raise("Oh noes!!")),
                    "Does not match!!",
                    expectedException
                )
            )

            exception catch()

            IoAssertion assertEqual(exception error, expectedException, "The correct exception was not raised")
        )
    ) \
    test(
        "succeeds when test block raises exception",

        block(
            expectedException := "Expected exception"

            exception := try(
                IoAssertion assertRaisesException(
                    block(Exception raise("Exception was raised")),
                    nil,
                    expectedException
                )
            )

            exception catch()

            IoAssertion assert(exception == nil, "An exception was raised: #{exception}" interpolate)
        )
    ) \
    test(
        "succeeds when test block raises exception and exception message matches",

        block(
            expectedException := "Expected exception"

            exception := try(
                IoAssertion assertRaisesException(
                    block(Exception raise(expectedException)),
                    expectedException
                )
            )

            exception catch()

            IoAssertion assert(exception == nil, "An exception was raised: #{exception}" interpolate)
        )
    )