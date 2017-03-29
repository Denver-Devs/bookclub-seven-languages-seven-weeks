/*
Do:
+ Run an Io program from a file // you're doin' it, sucka!
+ Execute the code in a slot given its name.
*/

Pet := Object clone
Pet vocabulary := "grumble mumble rumble bumble"
Pet speak := method("\"#{vocabulary}\"" interpolate)

Dog := Pet clone
Dog vocabulary := "bow wow oh wow oh boy oh wow oh wow"

"the #{Dog type} goes #{Dog speak}" interpolate println
