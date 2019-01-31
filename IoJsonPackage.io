LibPath addPathWithBaseByDirName("IoJson", "libs/IoModuleConfig")

IoJsonPackage := ModuleConfig clone \
    do(
        setName("IoJson")
        setVersion("1.0.0")

        initializeModuleLoader()
    )

IoJsonPackage init := method(
    prodConfig(block(
        moduleLoader \
            addSearchPath("ast") \
            addSearchPath("lexer") \
            addSearchPath("parser") \
            addSearchPath("utilities") \
            configure()
    ))

    devConfig(block(
    ))
)