ModuleConfig := Object clone

ModuleConfig moduleLoader := nil
ModuleConfig name ::= nil
ModuleConfig version ::= nil

ModuleConfig development := nil
ModuleConfig production := nil

ModuleConfig initializeModuleLoader := method(
    moduleLoader = ModuleLoader clone
    moduleLoader setBasePathByName(name)
)

ModuleConfig prodConfig := method(
    prodConfigBlock,

    production = block(
        prodConfigBlock call()
    )

    if(development == nil) \
        then(development = production)
    
    return self
)

ModuleConfig devConfig := method(
    devConfigBlock,

    development = block(
        if(production != nil) \
            then(production call())
            
        devConfigBlock call()
    )
)