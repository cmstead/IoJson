ioTest testSuite("IoAssertion assertEqual") \
    test(
        "raises an exception when values are not equal",

        block(
            exception := try(
                expected := false
                actual := true

                IoAssertion assertEqual(expected, actual, "Expected exception")
            )

            exception catch()

            IoAssertion assert(exception != nil, "An exception was not raised")
        )
    ) \
    test(
        "does not raise an exception when values are equal",

        block(
            exception := try(
                expected := true
                actual := true

                IoAssertion assertEqual(expected, actual, "No exception expected")
            )

            exception catch()

            IoAssertion assert(exception == nil, "An exception was raised")
        )
    )