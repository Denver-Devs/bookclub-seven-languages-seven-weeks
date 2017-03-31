// Create a list syntax that uses brackets.

Object squareBrackets := method(
  call message arguments map(x, x asString asMutable removeSeq("\""))
)

listy := [ "apple", "banana", "carrrots", 1, 2, 3 ]
listy println

listy at(0) println
listy at((listy size) - 1) println
