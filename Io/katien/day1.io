// Answer:
// Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly typed? Support your answer with code.
1 + 1 println
e := try( 1 + "one" )

e catch( Exception, writeln("Looks like io is strongly typed.") )
writeln

// Is 0 true or false? What about the empty string? Is nil true or false? Support your answer with code.
truthTest := method( test, if( test, writeln(test, " is truthy!"), writeln(test, " is falsy!") ) )

truthTest(true)
truthTest(false)
truthTest("")
truthTest(0)
truthTest(nil)
writeln


// How can you tell what slots a prototype supports?
writeln("The Object type supports the following slots: \n", Object slotNames)
writeln

// What is the difference between = (equals), := (colon equals), and ::= (colon colon equals)? When would you use each one?
// = assigns to an existing slot
Cat := Object clone
e := try( Cat color = "white")
e catch( Exception, writeln("The color slot doesn't exist yet, so it must be set with := or ::=") )
Cat color := "white"
Cat color = "yellow"

// := creates a slot and assigns to it
Cat name := "mac"

// ::= creates a slot and a setter method (setSlotName) and assigns
Cat age ::= 3
writeln(Cat)

// this setter does not exist
e := try( setName("nothing will happen") )
e catch( Exception, writeln("The setter setName for name doesn't exist because the name slot wasn't created with ::=") )


// only age will have a setter
Cat setAge(13)
writeln(Cat)
writeln

// Do:
// Run an Io program from a file.
// io day1.io

// Execute the code in a slot given its name.
Cat meow := method( writeln("meow") )
Cat meow := method( writeln("meow") )
Cat meow
