RunnerUtils := Object clone

RunnerUtils getFilePaths := method(
    fullPath,

    Directory \
        with(fullPath) \
        fileNames \
        map(fileName, (
            "#{fullPath}/#{fileName}" interpolate
        ))
)

RunnerUtils getFileNames := method(
    testPaths, isTestFile,

    testPaths \
        map(path, (
            fullPath := "#{self cwd}/#{path}" interpolate
            getFilePaths(fullPath)
        )) \
        flatten \
        select(fileName, isTestFile(fileName))
)