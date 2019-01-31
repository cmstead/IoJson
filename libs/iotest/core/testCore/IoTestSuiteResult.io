IoTestSuiteResult := Object clone do(
    testResults := nil
    description ::= nil

)

IoTestSuiteResult init := method(
    testResults = list()
)

IoTestSuiteResult addTestResult := method(
    testResult,
    testResults append(testResult)
)