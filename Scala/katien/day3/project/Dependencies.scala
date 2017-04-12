import sbt._

object Dependencies {
    // lazy val scalaTest = "org.scalatest" %% "scalatest" % "3.0.1"

    val backendDeps = Seq(
        "com.typesafe.akka" %% "akka-actor" % "2.4.17",
        "com.typesafe.akka" %% "akka-testkit" % "2.4.17",
        "net.ruippeixotog" %% "scala-scraper" % "1.2.0"
        // "org.scalatest" %% "scalatest" % "2.2.6" % "test",
        // "junit" % "junit" % "4.12" % "test",
        // "com.novocode" % "junit-interface" % "0.11" % "test"
    )
}
