IoTestCase := Object clone

IoTestCase description ::= nil
IoTestCase testBlock ::= nil
IoTestCase status ::= nil
IoTestCase testError := nil

IoTestCase runTestCase := method(
    status = "pass"

    testException := try(
        testBlock call()
    )

    testException catch(
        status = "fail"
        testError = testException error
    )

)

IoTestCase buildTestResult := method(
    IoTestCaseResult clone \
        setStatus(status) \
        setDescription(description) \
        setError(testError)
)

IoTestCase run := method(
    if(
        status == nil,
        runTestCase()
    )

    buildTestResult()
)