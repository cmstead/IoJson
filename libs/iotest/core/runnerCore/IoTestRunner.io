IoTestRunner := Object clone

IoTestRunner cwd ::= nil
IoTestRunner ioTest := nil
IoTestRunner testExtension := nil
IoTestRunner testPaths ::= nil

IoTestRunner init := method(
    ioTest = IoTest clone
    testExtension = ".io"

    setCwd(Directory currentWorkingDirectory)
    setTestPaths(list())

    return self
)

IoTestRunner setTestExtension := method(
    extension,

    testExtension = "#{extension}.io" interpolate
    return self
)

IoTestRunner addTestPath := method(
    testPath,

    testPaths append(testPath)
    return self
)

IoTestRunner buildFileCheck := method(
    expectedExtension := testExtension
    extensionLength := testExtension size

    return block(
        fileName exSlice(extensionLength * -1) == expectedExtension
    )
)

IoTestRunner loadTests := method(
    isTestFile := buildFileCheck()

    RunnerUtils getFileNames(testPaths, isTestFile) \
        foreach(i, fileName, (
            proto := doFile(fileName)
        )
    )

    return ioTest
)

IoTestRunner report := method(
    testSuiteResults,

    IoTestReporter clone writeBannerAndReport(testSuiteResults)
)

IoTestRunner run := method(
    testSuiteResults := \
        loadTests() \
        runTests()
    
    report(testSuiteResults)
)