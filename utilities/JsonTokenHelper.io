JsonTokenHelper := Object clone

JsonTokenHelper isSurroundingCharacter := method(
    character,

    character == "{" \
    or character == "}"\
    or character == "["\
    or character == "]"
)