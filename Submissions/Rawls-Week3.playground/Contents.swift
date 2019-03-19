//: ## Functions and Closures
//: 1.)
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//:  Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
func greet(_ person: String, with lunch: String) -> String {
    return "Hello \(person), today's lunch special is \(lunch)."
}
greet("John", with: "spaghetti")

//: 2.)
//:
//: Rewrite the closure to return zero for all odd numbers.
//:
var numbers = [20, 19, 7, 12]

//: full "syntactic sugar" form:
numbers.map({ (number: Int) -> Int in
    return number % 2 == 0 ? 3 * number : 0
})
//: omitting parameters and return type form:
let mappedNumbers = numbers.map({ number in number % 2 == 0 ? 3 * number : 0 })
print(mappedNumbers)
//: reference variable form:
let mappedNums = numbers.map { $0 % 2 == 0 ? 3 * $0 : 0 }
print(mappedNums)
//: ## Objects and Classes
//: 3.)
//:
//: Add a constant property with `let`, and add another method that takes an argument.
//:
//: 4.)
//:
//: This version of the `Shape` class is missing something important: an initializer to set up the class when an instance is created. Use `init` to create one.
//:
class Shape {
    let constant: String

    var numberOfSides = 0

    init(constant: String) {
        self.constant = constant
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }

    func method(argument: String) {

    }
}

//: 5.)
//:
//: Make a subclass of `NamedShape` called `Circle` that takes a radius and a name as arguments to its initializer. Implement an `area()` and a `simpleDescription()` method on the `Circle` class.
//:
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


class Circle: NamedShape {
    let radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }

    override func simpleDescription() -> String {
        return "A circle is a shape with no sides."
    }

    func area() {
        print("I'm too lazy to calculate an area for \(radius)")
    }
}
//: ## Enumerations and Structures
//: 6.)
//:
//: Write a function that compares two `Rank` values by comparing their raw values.
//:
enum Rank: Int, CaseIterable {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

func compare(_ first: Rank, and second: Rank) -> Bool {
    return first.rawValue > second.rawValue
}
//: 7.)
//:
//: Add a `color()` method to `Suit` that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
//:
enum Suit: CaseIterable {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }

    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()
//: 8.)
//:
//: Add a third case to `ServerResponse` and to the switch.
//:
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case gamble(Rank)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let internalError = ServerResponse.gamble(.ace)

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .gamble(rank):
    print("Never bet on \(rank)")
}

//: 9.)
//:
//: Write a function that returns an array containing a full deck of cards, with one card of each combination of rank and suit.
//:
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

func deckOfCards() -> [Card] {

    var deck = [Card]()

    for suit in Suit.allCases {
        for rank in Rank.allCases {
            deck.append(Card(rank: rank, suit: suit))
        }
    }

    return deck
}
