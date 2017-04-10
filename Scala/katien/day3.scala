// Find.
// For the sizer program, what would happen if you did not create a new actor for each link you wanted to follow? What would happen to the performance of the application?
// the same thread would be used for all requests so they would not run concurrently
// Do:
// Take the sizer application and add a message to count the number of links on the page.
// Make the sizer follow the links on a given page, and load them as well. For example, a sizer for “google.com” would compute the size for Google and all of the pages it links to.

import scala.io._
import akka.actor.{ ActorSystem, Props, Actor }

case class checkPage(url: String)

object PageLoader {
    def getPageSize(url: String): Int = Source.fromURL(url).mkString.length
    def getPageLinks(url: String): Int = Source.fromURL(url).mkString.length
}

class Loader extends Actor {
    def receive = {
      case checkPage(url) => println(s"Size for $url is ${PageLoader.getPageSize(url)}")
    }
}


object DayThree extends App {
    // actor system is heavyweight, create only one per application. manages thread allocation
    val system = ActorSystem("basicsystem")

    val urls = List(
        "https://www.facebook.com/",
        "https://www.twitter.com/",
        "https://www.gmail.com/",
        "https://www.stackoverflow.com/",
        "https://www.scala-lang.org/"
    )

    urls.foreach { url =>
        val loader = system.actorOf(Props[Loader])
        loader ! checkPage(url)
    }
}
