/*
1. Enhance the XML program to add spaces to show the indentation structure.

2. Enhance the XML program to handle attributes: if the first argument is a map (use the curly brackets syntax), add attributes to the XML program. For example:

    `book({"author": "Tate"}...)` would print `<book author="Tate">`
*/

OperatorTable addAssignOperator(":", "atParseHash")

Builder := Object clone do(
  indent := ""

  atParseHash := method(
    key   := call evalArgAt(0) asMutable removeSeq("\"")
    value := call evalArgAt(1)
    " #{key}=\"#{value}\"" interpolate
  )

  curlyBrackets := method(
    call message arguments map(arg,
      self doMessage(arg)
    ) join("")
  )

  forward := method(
    name  := call message name
    args  := call message arguments
    attrs := ""

    if(args size > 0 and args at(0) name == "curlyBrackets",
      attrs = doMessage(args removeFirst)
    )

    writeln(indent, "<", name, attrs, ">")

    args foreach(arg,
      indent = indent .. "  "
      content := self doMessage(arg)
      if(content type == "Sequence", writeln(indent, content))
      indent = indent exclusiveSlice(2)
    )

    writeln(indent, "</", name, ">")
  )
)

/*
moving the "site" to a separate file is necessary so that the OperatorTable is updated
*/
doFile("site.txt")
