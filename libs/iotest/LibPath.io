LibPath := Object clone

LibPath launchPath ::= nil
LibPath libPathName ::= nil
LibPath basePath := nil

LibPath init := method(
    setLaunchPath(System launchPath)
    libPathName = "libs"

    setBasePath()
)

LibPath setBasePath := method(
    basePath = "#{launchPath}/#{libPathName}" interpolate
    return self
)

LibPath setLaunchPath := method(
    newLaunchPath,

    launchPath = newLaunchPath
    setBasePath()

    return self
)

LibPath setLibPathName := method(
    pathName,

    libPathName = pathName

    setBasePath()

    return self
)

LibPath addLibPaths := method(
    PathUtil getDirectoryPaths(basePath) \
        foreach(pathName, (
            libPath := "#{basePath}/#{pathName}" interpolate
            addPath(libPath)
        ))
    
    return self
)

LibPath addPathWithBase := method(
    basePath, pathName,

    LibPath addPath("#{basePath}/#{pathName}" interpolate)
)

LibPath addPath := method(
    pathName,

    Importer addSearchPath(pathName)

    return self
)

LibPath addPathWithBaseByDirName := method(
    dirName, searchPath,

    basePath := PathUtil getSearchPathByDirName(dirName)
    addPathWithBase(basePath, "libs/ModuleConfig")
)