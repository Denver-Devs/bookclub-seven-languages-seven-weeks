// Find:
// A discussion on how to use Scala files
// http://alvinalexander.com/scala/how-to-write-text-files-in-scala-printwriter-filewriter
// What makes a closure different from a code block
// closures retain copies of the variables in the scope where they are created
// http://alvinalexander.com/scala/how-to-use-closures-in-scala-fp-examples

// Do:
// Use foldLeft to compute the total size of a list of strings.
val family = List("Kate", "James", "Matthew", "Tom", "Yingnan", "Cat")
val size = family.foldLeft(0)((total, member) => { total + member.size })
println(s"The size of the list: $family is $size")
println

// Write a Censor trait with a method that will replace the curse words Shoot and Darn with Pucky and Beans alternatives. Use a map to store the curse words and their alternatives.
// Load the curse words and alternatives from a file.
trait Censor {
    val badWords = io.Source.fromFile("badWords.txt").getLines
        .map(line => line.split(' ')(0) -> line.split(' ')(1))
        .toMap

    def replaceBadWords(original:String): String = {
        var censored = original
        badWords.foreach(badWord => { censored = censored.replace(badWord._1, badWord._2) })
        censored
    }
}

class Prose() extends Object with Censor {
    val text = scala.io.StdIn.readLine(s"Enter some text.\n")
    val censoredProse = replaceBadWords(text)
}

val prose = new Prose()
println(s"The censored version of the prose is:\n${prose.censoredProse}")
