LibPath addPathWithBaseByDirName("iotest", "libs/ModuleConfig")

IoTestPackage := ModuleConfig clone \
    do(
        setName("iotest")
        setVersion("1.0.0")

        initializeModuleLoader()
    )

IoTestPackage init := method(
    prodConfig(block(
        moduleLoader \
            addSearchPath("core") \
            addSearchPath("core/runnerCore") \
            addSearchPath("core/assertionCore") \
            addSearchPath("core/testCore") \
            configure()
    ))

    devConfig(block(

    ))
)