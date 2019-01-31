ioTest testSuite("IoAssertion assertNotEqual") \
    test(
        "raises an exception when values are equal",

        block(
            expectedError := "Expected exception";

            exception := try(
                expected := true
                actual := true

                IoAssertion assertNotEqual(expected, actual, expectedError)
            )

            exception catch()

            IoAssertion assert(exception error == expectedError, "Method failed to raise the correct exception")
        )
    ) \
    test(
        "does not raise an exception when values are not equal",

        block(
            exception := try(
                expected := false
                actual := true

                IoAssertion assertNotEqual(expected, actual, "No exception expected")
            )

            exception catch()

            IoAssertion assert(exception == nil, "An exception was raised")
        )
    )