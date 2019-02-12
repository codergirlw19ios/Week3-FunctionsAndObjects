//: ## Functions and Closures
//: 1.)
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//:  Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:

func greet(person: String, lunchSpecial: String) -> String {
    return "Hello \(person), today's lunch special is \(lunchSpecial)"
}
greet(person: "Chetna", lunchSpecial: "Falafel sandwich")

//: 2.)
//:
//: Rewrite the closure to return zero for all odd numbers.
//:
var numbers = [20, 19, 7, 12]

//: full "syntactic sugar" form:
numbers.map({ (number: Int) -> Int in
    if(number % 2 == 1) {
        return 0
    }
    else {
        let result = 3 * number
        return result
    }
})

//: omitting parameters and return type form:
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
//: reference variable form:
let mappedNums = numbers.map { 3 * $0 }
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
    var numberOfSides = 0
    let something = "something"
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func amIASquare(sidesEqual: Bool) -> Bool {
        if(numberOfSides == 4 && sidesEqual) {
            return true
        } else {
            return false
        }
    }
}
var shape = Shape()
shape.numberOfSides = 4
print(shape.amIASquare(sidesEqual: true))

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func simpleDecription() -> String {
        return " A shape with \(numberOfSides) sides."
    }
}

//: 5.)
//:
//: Make a subclass of `NamedShape` called `Circle` that takes a radius and a name as arguments to its initializer. Implement an `area()` and a `simpleDescription()` method on the `Circle` class.
//:

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name : name)
    }
    
    func area() -> Double {
        return 3.142 * radius * radius
    }
    override func simpleDecription() -> String {
        return "A circle with a radius \(radius)"
    }
}

var circle = Circle(radius: 2, name: "Circle")
print(circle.simpleDecription())
print(circle.area())

//: ## Enumerations and Structures
//: 6.)
//:
//: Write a function that compares two `Rank` values by comparing their raw values.
//:
enum Rank: Int {
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

func compareTwoRanks(rank1: Rank, rank2: Rank) -> String {
    if( rank1.rawValue < rank2.rawValue) {
        return "\(rank1.simpleDescription()) is less than \(rank2.simpleDescription())"
    }
    else {
        return "\(rank1.simpleDescription) is more than \(rank2.simpleDescription)"
    }
}

var rank1 = Rank.ace
var rank2 = Rank.king

print(rank1.rawValue)
print(compareTwoRanks(rank1: rank1, rank2: rank2))


//: 7.)
//:
//: Add a `color()` method to `Suit` that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
//:
enum Suit: CaseIterable{
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades: return "spades"
        case .hearts: return "hearts"
        case .diamonds: return "diamonds"
        case .clubs: return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs: return "black"
        case .diamonds, .hearts: return "red"
        }
    }
    
}

let hearts = Suit.hearts
hearts.simpleDescription()
hearts.color()

//: 8.)
//:
//: Add a third case to `ServerResponse` and to the switch.
//:
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case lowVisibility(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")
let lowVisibility = ServerResponse.lowVisibility("Cloudy")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and Sunset is at \(sunset)")
case let .failure(message):
    print("Failure...\(message)")
case let .lowVisibility(reason):
    print("Low Visibility due to \(reason)")
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

for suit in Suit.allCases {
    print(suit.simpleDescription())
}

func deck() -> [Card] {
    var deck: [Card] = []
    for i in 1...13 {
        for suit in Suit.allCases {
            deck.append(Card(rank: Rank.init(rawValue: i)!, suit: suit))
        }
    }
    return deck
}
var deckOfCards = deck()
for card in deckOfCards {
    print(card.simpleDescription())
}



