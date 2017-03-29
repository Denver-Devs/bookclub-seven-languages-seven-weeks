// Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly typed? Support your answer with code.
// Strongly typed

writeln(1 + 1)
//writeln(1 + "one") // it won't work

writeln("one" .. "two")
writeln(1 .. "one")
writeln("two" .. 2)

// Is 0 true or false? What about the empty string? Is nil true or false? Support your answer with code.

if(0, "0 is true" println, "0 is false" println)
if("", "\"\" is true" println, "\"\" is false" println)
if(nil, "nil is true" println, "nil is false" println)


// How can you tell what slots a prototype supports?
Pet := Object clone
Pet name := "Harper"
Pet color := "black"
writeln(Pet slotNames)


// What is the difference between = (equals), := (colon equals), and ::= (colon colon equals)? When would you use each one?
/*
`=`   - "Update slot." assign value to existing slot
`:=`  - "Set slot." initialize a slot and assign a value
`::=` - "New slot." create a slot, create a setter, assign a value
*/

