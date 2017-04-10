import akka.actor.{ ActorRef, ActorSystem, Props, Actor, Inbox }
import scala.concurrent.duration._

// simple objects act as messages
case object Poke
case object Feed

// Kid is an actor, it recieves messages in a queue
class Kid(name: String) extends Actor {
    // handle messages
    def receive = {
        case Poke => {
            println(s"$name: Ouch")
        }
        case Feed => {
            println(s"$name: nom nom nom")
        }
    }
}

object HelloAkkaScala extends App {
    // ActorSystem is heavyweight, create only one per application. manages thread allocation
    val system = ActorSystem("basicsystem")

    // instantiate actors
    val lisa = system.actorOf(Props(new Kid("lisa")), "lisa")
    val bart = system.actorOf(Props(new Kid("bart")), "bart")

    // send messages
    bart ! Poke
    bart ! Feed

    lisa ! Poke
    lisa ! Feed
}