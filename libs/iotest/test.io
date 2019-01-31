packageConfig := IoTestPackage clone
cwd := PathUtil getSearchPathByDirName(packageConfig name)

packageConfig development call

IoTestRunnerFactory \
    buildRunner() \
        setCwd(cwd) \
        setTestExtension(".test") \
        addTestPath("tests") \
        run()