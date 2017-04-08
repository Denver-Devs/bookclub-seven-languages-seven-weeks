// Find:
// The Scala API - http://www.scala-lang.org/api/2.12.1/
// A comparison of Java and Scala - https://www.quora.com/How-does-Scala-compare-to-Java-8
// A discussion of val versus var - http://stackoverflow.com/questions/1791408/what-is-the-difference-between-a-var-and-val-definition-in-scala
// Do:
// Write a game that will take a tic-tac-toe board with X, O, and blank characters and detect the winner or whether there is a tie or no winner yet. Use classes where appropriate.
// Bonus problem: Let two players play tic-tac-toe.


// X is 1, O is 2, empty fields are 0
class TicTacToe () {
    var board = Array(Array(0,0,0), Array(0,0,0), Array(0,0,0))

    def this(customBoard: Array[Array[Int]]) = {
        this()
        board = customBoard
    }

    def setValueAtCoords(value: Int, coords: (Int, Int)):Boolean = {
        if (coords._1 < 0 || coords._1 > 2 || coords._2 < 0 || coords._1 > 2) {
            println("Coordinates out of bounds. Remember to use 0 based indexes.")
            return false
        }

        if (board(coords._2)(coords._1) != 0) {
            println("That spot is taken.")
            return false
        } else {
            println(s"Setting value: ${if (value == 1) "X" else "O"} at (${coords._2}, ${coords._1}).")
            board(coords._2)(coords._1) = value
        }
        printBoard
        true
    }

    def printBoard = {
        println("---------")
        board.foreach {r:Array[Int] =>
            print("| ")
            r.foreach {v =>
                if (v == 1) {
                    print("X ")
                } else if (v == 2) {
                    print("O ")
                } else {
                    print("_ ")
                }
            }
            println("|")
        }
        println("---------")
    }

    def checkWin(): Boolean = {
        val testSet = (test:Array[Int]) => {
            if (test.toSet.size == 1 && test(0) != 0) {
                println(s"Win by ${if (test(0) == 1) "X" else "O"}")
                return true
            }
        }
        // test rows
        board.foreach { testSet(_) }

        // test columns
        val cols: Array[Array[Int]] = Array(Array(), Array(), Array())
        for (i <- 0 until 3) {
            cols(i) = board.map(_(i))
        }
        cols.foreach { testSet(_) }

        // test diagonals
        testSet(Array(board(0)(0), board(1)(1), board(2)(2)))
        testSet(Array(board(0)(2), board(1)(1), board(2)(0)))

        false
    }
}
println("An automated game:")
var board = Array(Array(0,1,2), Array(2,0,1), Array(1,2,0))
var automatedGame = new TicTacToe(board)
automatedGame.printBoard
println

println(s"Winner? ${automatedGame.checkWin}")
println

automatedGame.setValueAtCoords(1,(0,0))
automatedGame.setValueAtCoords(1,(1,1))
automatedGame.setValueAtCoords(1,(2,2))
println(s"Winner? ${automatedGame.checkWin}")
println
println


println("A two player game:")
var game = new TicTacToe()
var turnCtr = 1
var winner = false
var moving = true
var coords: Array[Int] = Array()

println("Enter the X and Y coordinates of your next moves in this format:\n X Y")
game.printBoard

while (!winner) {
    while (moving) {
        val input = readLine(s"${if (turnCtr % 2 == 0) "X" else "O"}'s turn. Enter the X and Y coordinates of your next move.")
        coords = input.split(" ").map(_.toInt)
        // if the move fails due to bad input, the user will be prompted for a new move again
        moving = !game.setValueAtCoords((turnCtr % 2) + 1, (coords(0), coords(1)))
    }
    winner = game.checkWin
    moving = true
    turnCtr += 1
}
