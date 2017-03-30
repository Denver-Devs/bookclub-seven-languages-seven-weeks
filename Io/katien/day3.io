# XML
Builder := Object clone
Builder indent := 0

# when an unknown message is sent to builder, parse it as an XML tag
Builder forward := method(
    self indent repeat(write("    "))
    writeln("<", call message name, ">")
    # store the current indentation level
    closing_indent := self indent

    call message arguments foreach(i, arg,
        if (i == 0,
            self indent = self indent + 1,
            self indent = closing_indent + 1
        )
        content := self doMessage(arg);
        if (content type == "Sequence",
            self indent repeat(write("    "))
            writeln(content)
        )
    )

    closing_indent repeat(write("    "))
    writeln("</", call message name, ">")
)

b1 := Builder clone
b1 body(
    ul(
        li("item 1 - ",
            a("link 1")
        ),
        li("item 2 - ",
            a("link 2")
        ),
        li("item 3 - ",
            a("link 3")
        )
    ),
    p("A test paragraph to go with your list")
)
