PathUtil := Object clone

PathUtil getDirectoryPaths := method(
    libsPath,

    baseDirectory := Directory with(libsPath)

    return \
        Directory \
            with(libsPath) \
            items \
            select(item, (item name != ".") and (item name != "..")) \
            map(item, item name)
)

PathUtil getSearchPathByDirName := method(
    dirName,

    searchPaths := Importer paths

    return Importer paths \
        select(path, path findSeq(dirName) != nil) \
        at(0)
)
