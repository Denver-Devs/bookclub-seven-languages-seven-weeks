// Run from file with `io Day3-3.io`

# Set default line padding here; I like 4 spaces
defaultPadding := "    "

# Add the assignment operator to make key value pairs with a colon work
OperatorTable addAssignOperator(":", "makeAttributeString")

Builder := Object clone do (
	padding := ""

	# Convert the key value pair to XML attribute format
	makeAttributeString := method(
		attr := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
		val := call evalArgAt(1)
		" #{attr}=\"#{val}\"" interpolate
	)

	curlyBrackets := method(
		call message arguments map(arg, self doMessage(arg)) join
	)

	forward := method(
		args := call message arguments
		name := call message name
		attrs := ""

		# If we have a curly bracket arg, evaluate and convert it to an attribute string
		if(args first name == "curlyBrackets",
			bracketArg := args removeFirst
			attrs = doMessage(bracketArg)
		)

		writeln(padding, "<", name, attrs, ">")
		# This loop is a little sketchy because args may be mutated conditionally at line 30
		args foreach(
			arg,
			padding = padding .. defaultPadding
			content := self doMessage(arg)
			if(content type == "Sequence", writeln(padding, content))
			padding = padding asMutable removeSlice(0, defaultPadding size - 1) # NOTE: Have to make it mutable to slice
		)
		writeln(padding, "</", name, ">")
	)
)


// This is an awful workaround - you throw Exception: Sequence does not respond to ':' if you run the code inside doString directly from a file.
// Steve Dekorte says this is because the addAssignOperator can't be applied within the source file where it is called. https://github.com/stevedekorte/io/issues/259
// Therefore we cheat and wrap it in a pseudo-eval of the string. Suck it, multi-file evaluation. I found this workaround at https://jezenthomas.com/io-day-three/

doString(
	"""
	Builder ul(
		li({"style" : "someClass"}, "Io"),
		li("Lua"),
		li("JavaScript")
	)
	"""
)

doString(
	"""
	Builder html(
		head(
			title("Io Parses Stuff Real Good")
		),
		body(
			h1("Like, real good."),
			h2("I mean, seriously good."),
			div({"class" : "somethingBootstrapLolSorryFrontEndDevs", "id" : "dToThaIv"},
				p("It's quite unbelievable."),
				p({"style" : "bootstrapCSSlol"}, "Almost as unbelievable as the hatred for Bootstrap among the design-inclined.")
			),
			marquee("1999 is calling!")
		)
	)
	"""
)