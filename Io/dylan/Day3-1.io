// Run from file with `io Day3-1.io`

# Set default line padding here; I like 4 spaces
defaultPadding := "    "

Builder := Object clone do (
	padding := ""

	forward := method(
		writeln(padding, "<", call message name, ">")
		call message arguments foreach(
			i,
			arg,
			padding = padding .. defaultPadding
			content := self doMessage(arg)
			if(content type == "Sequence", writeln(padding, content))
			padding = padding asMutable removeSlice(0, defaultPadding size - 1) # NOTE: Have to make it mutable to slice
		)
		writeln(padding, "</", call message name, ">")
	)
)

Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript")
)