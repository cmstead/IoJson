IoTest := Object clone

IoTest testSuites := nil

IoTest init := method(
    testSuites = list()    
)

IoTest testSuite := method(
    description,

    newTestSuite := IoTestSuite clone
    newTestSuite setDescription(description)

    testSuites append(newTestSuite)

    return newTestSuite
)

IoTest runTests := method(
    testSuiteResults := list()

    testSuites \
        foreach(
            testSuite,
            testSuiteResult := testSuite run()

            testSuiteResults append(testSuiteResult)
        )
    
    return testSuiteResults
)