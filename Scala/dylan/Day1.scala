class TicTacToe {
    val board = Array(
        Array(" ", " ", " "),
        Array(" ", " ", " "),
        Array(" ", " ", " ")
    )

    var player = "X"

    def turn(mark: String, coord: (Int, Int)) : Boolean = {
        if (mark == player && board(coord._1)(coord._2) == " ") {
            board(coord._1)(coord._2) = mark

            if (player == "X") {
                player = "O"
            }
            else {
                player = "X"
            }

            return true
        }
        else {
            return false
        }
    }

    def evaluate : String = {
        def getRow(index : Int) = {
            board(index)
        }

        def getCol(index : Int) = {
            board.map {
                row => row(index)
            }
        }

        def isGameWon(line : Array[String]) = {
            if (!line(0).equals(" ") && line(0).equals(line(1)) && line(1).equals(line(2))) {
                true
            }
            else {
                false
            }
        }

        def isBoardFull() : Boolean = {
            board.foreach {
                row => row.foreach {
                    element => if (element == " ") {
                        return false
                    }
                }
            }
            return true
        }

        val rows = (0 to 2).map {
            index => getRow(index)
        }
        val cols = (0 to 2).map {
            index => getCol(index)
        }
        val diag1 = Array(board(0)(0), board(1)(1), board(2)(2))
        val diag2 = Array(board(0)(2), board(1)(1), board(2)(0))

        val lines = rows ++ cols ++ Array(diag1, diag2)

        lines.foreach {
            line => if (isGameWon(line)) {
                return "WINNER is player " + line(0)
            }
        }

        if (isBoardFull()) {
            return "TIE GAME"
        }

        return "KEEP PLAYING"
    }

    def printBoard = {
        println("" + board(0)(0) + "" + board(0)(1) + "" + board(0)(2))
        println("" + board(1)(0) + "" + board(1)(1) + "" + board(1)(2))
        println("" + board(2)(0) + "" + board(2)(1) + "" + board(2)(2))
    }
}

val game = new TicTacToe

println("Positions Help: ")
println("(0,0) (0,1) (0,2)")
println("(1,0) (1,1) (1,2)")
println("(2,0) (2,1) (2,2)")

while (game.evaluate == "KEEP PLAYING") {
    println("~~~")
    println(game.player + ", make a move\n")
    var isMoveValid = false
    do {
        print("Row: ")
        val row = Console.readInt
        print("Col: ")
        val col = Console.readInt
        if ((row == 0 || row == 1 || row == 2) && (col == 0 || col == 1 || col == 2)) {
            isMoveValid = game.turn(game.player, (row, col))
            if (!isMoveValid) {
                println("Move invalid, pick another")
            }
        }
        else {
            isMoveValid = false
            println("Please specify Row and Col values of 0, 1, or 2 exclusively.")
        }
    }
    while (isMoveValid == false)
    println("~~~")
    game.printBoard
}
println(game.evaluate)