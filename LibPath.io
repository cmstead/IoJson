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
    basePath = PathUtil joinPath(launchPath, libPathName)

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
            libPath := PathUtil joinPath(basePath, pathName)
            addPath(libPath)
        ))
    
    return self
)

LibPath addPathWithBase := method(
    basePath, pathName,

    pathToAdd := PathUtil joinPath(basePath, pathName)

    LibPath addPath(pathToAdd)
)

LibPath addPath := method(
    pathName,

    Importer addSearchPath(pathName)

    return self
)

LibPath addPathWithBaseByDirName := method(
    dirName, searchPath,

    basePath := PathUtil getSearchPathByDirName(dirName)
    addPathWithBase(basePath, searchPath)
)