IoTestReporter := Object clone

IoTestReporter testCount := nil
IoTestReporter testStats := nil

IoTestReporter init := method(
    testCount = 0
    testStats = Map clone

    testStats atPut("pass", 0)
    testStats atPut("fail", 0)
    testStats atPut("skipped", 0)
)

IoTestReporter banner := \
"""
    ==============
    *** IoTest ***
    ==============

"""

IoTestReporter updateTestStats := method(
    status,

    testCount = testCount + 1
    statCount := testStats at(status) + 1

    testStats atPut(status, statCount)
)


IoTestReporter reportTestResult := method(
    testResult,

    updateTestStats(testResult status)

    writeln("        #{testResult status} -- #{testResult description}" interpolate)

    if(
        testResult error != nil,
        writeln("        Error: #{testResult error}\n" interpolate)
    )
)

IoTestReporter reportSuiteResults := method(
    testSuiteResult,

    writeln("\n    #{testSuiteResult description}\n" interpolate)

    testSuiteResult testResults \
        foreach(
            testResult,

            reportTestResult(testResult)
        )
)

IoTestReporter reportStats := method(
    passed := testStats at("pass")
    failed := testStats at("fail")
    skipped := testStats at("skipped")

    """

    --------------

    Test results:

        Passed: #{passed}
        Failed: #{failed}
        Skipped: #{skipped}
    
    --------------""" interpolate println
)

IoTestReporter report := method(
    testSuiteResults,

    testSuiteResults \
        foreach(
            testSuiteResult,

            reportSuiteResults(testSuiteResult)
        )
)

IoTestReporter writeBannerAndReport := method(
    testSuiteResults,

    writeln(banner)

    report(testSuiteResults)

    reportStats()
)