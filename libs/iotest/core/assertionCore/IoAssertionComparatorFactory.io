IoAssertionComparatorFactory := Object clone

IoAssertionComparatorFactory equal := block(
    expected, actual,

    block(expected == actual)
)

IoAssertionComparatorFactory notEqual := block(
    expected, actual,

    block(expected != actual)
)