ModuleLoader := Object clone

ModuleLoader libPathInstance := nil
ModuleLoader searchPaths := nil
ModuleLoader libPathName ::= nil
ModuleLoader basePath ::= nil

ModuleLoader init := method(
    libPathInstance = LibPath clone
    basePath = System launchPath
    searchPaths = list()
)

ModuleLoader addSearchPath := method(
    searchPath,

    searchPaths append("#{basePath}/#{searchPath}" interpolate)

    return self
)

ModuleLoader setBasePathByName := method(
    dirName,

    basePath = PathUtil getSearchPathByDirName(dirName)
)

ModuleLoader configure := method(
    libPathInstance setLaunchPath(basePath)

    if(libPathName != nil) \
        then(libPathInstance setLibPathName(libPathName))

    libPathInstance addLibPaths()

    searchPaths foreach(
        searchPath,
        libPathInstance addPath(searchPath)
    )
)
