// Find.
// For the sizer program, what would happen if you did not create a new actor for each link you wanted to follow? What would happen to the performance of the application?
// the same thread would be used for all requests so they would not run concurrently
// Do:
// Take the sizer application and add a message to count the number of links on the page.
// Make the sizer follow the links on a given page, and load them as well. For example, a sizer for “google.com” would compute the size for Google and all of the pages it links to.
import scala.io._
import akka.actor.{ ActorSystem, Props, Actor }
import net.ruippeixotog.scalascraper.browser.JsoupBrowser
import net.ruippeixotog.scalascraper.model.{ Document }
import net.ruippeixotog.scalascraper.dsl.DSL._
import net.ruippeixotog.scalascraper.dsl.DSL.Extract._

case class checkPage(url: String)

class Loader extends Actor {
    def getPageSize(doc: Document): Int = doc.toString.length

    def getPageLinks(doc: Document):Option[Iterable[String]] = {
        doc >?> extractor("a", attrs("href"))
    }

    def receive = {
        case checkPage(url) => {
            val browser = JsoupBrowser()
            val doc = browser.get(url)

            var totalSize = getPageSize(doc)
            println(s"Size for $url is $totalSize characters\n")

            var validLinkCount = 0
            val linkGroups = getPageLinks(doc).iterator

            while (linkGroups.hasNext) {
                val links = linkGroups.next
                links.foreach { link =>
                    try {
                        if (link(0) == '/' || (link contains "http")) {
                            val linkedDoc = browser.get(if (link(0) == '/') url + link else link)
                            totalSize += getPageSize(linkedDoc)
                            validLinkCount += 1
                        }
                    } catch {
                      case e: Exception => println(s"Failed to load page at $link (referenced by $url)")
                    }
                }
            }
            println(s"\nThere are $validLinkCount valid links on $url, and the total size is $totalSize \n\n")
        }
    }
}

object DayThree extends App {
    val system = ActorSystem("basicsystem")
    val urls = List(
        "http://iolanguage.org",
        "http://github.com",
        "http://www.gmail.com",
        "http://www.scala-lang.org"
    )

    urls.foreach { url =>
        val loader = system.actorOf(Props[Loader])
        loader ! checkPage(url)
    }
}
