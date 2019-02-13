//: ## Functions and Closures
//: 1.)
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//:  Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
//func greet(_ person: String, on day: String) -> String {
//    return "Hello \(person), today is \(day)."
//}
//greet("John", on: "Wednesday")

// Laurie:  Not completely sure if this is what you are asking for but...
func greet(_ person: String, eating lunchSpecial: String) -> String {
    return "Hello \(person), todays lunch specal is \(lunchSpecial)."
}
greet("John", eating: "Fish and Chips")

//: 2.)
//:
//: Rewrite the closure to return zero for all odd numbers.
//:
var numbers = [20, 19, 7, 12]

//: full "syntactic sugar" form:
//numbers.map({ (number: Int) -> Int in
//    let result = 3 * number
//    return result
//})
// Laurie:  Answers
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
//    let returnme = result % 2 == 0 ? result : 0
    return result % 2 == 0 ? result : 0
})
//: omitting parameters and return type form:
// let mappedNumbers = numbers.map({ number in 3 * number })
// Laurie answer
let mappedNumbers = numbers.map({ number in 3 * number % 2 == 0 ? 3 * number : 0 })
print(mappedNumbers)
//: reference variable form:
//let mappedNums = numbers.map { 3 * $0 }
// Laurie: answer
let mappedNums = numbers.map { 3 * $0 % 2 == 0 ? 3 * $0 : 0  }
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
//class Shape {
//    var numberOfSides = 0
//    func simpleDescription() -> String {
//        return "A shape with \(numberOfSides) sides."
//    }
//}

//Laurie:  Answer
class Shape {
    var numberOfSides = 0
    let myVar = "Hello"
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func takesArgument(_ greeting: String) {
        print(greeting + " my friend")
    }
    init(count: Int) {
        numberOfSides = count
    }
}

let testLetwithClass = Shape(count: 5)
testLetwithClass.takesArgument("Hola")
testLetwithClass.numberOfSides = 6
// cannot modify let property unless use mutable



//: 5.)
//:
//: Make a subclass of `NamedShape` called `Circle` that takes a radius and a name as arguments to its initializer. Implement an `area()` and a `simpleDescription()` method on the `Circle` class.
//:

// Amanda -- I would change this to take just the radius, Circle itself should know what it is. i.e. a Circle -- so only 1 parm on the init/constructor

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

class Circle : NamedShape {
    var radius: Double = 0
    
    // Laurie slight change... each object should know how to handle itself - shouldn't have to pass in "circle" from outside..
    init( radius: Double)
    {
        self.radius = radius
        super.init(name: "Circle")
    }
    
    // What Amanda asked for...
//    init(name: String, radius: Double)
//    {
//        self.radius = radius
//        super.init(name: name)
//    }
    override func simpleDescription() -> String {
        let myArea = area()
        return "A \(name) with \(numberOfSides) sides, a radius of \(radius) and an area of \(myArea)"
    }
    
    /// area of circle = pi r^2
    func area() -> Double{
        return Double.pi * (radius * radius)
    }
}

var myShape = Circle(/*name: "Circle",*/ radius: 5.0)
myShape.simpleDescription()

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

func compareRank(r1: Rank, r2: Rank) -> Bool
{
    return r1.rawValue == r2.rawValue ? true : false
}
let R1 = Rank.ace
let R2 = Rank.ace
let outcome = compareRank(r1: R1, r2: R2)



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
let myColor = hearts.color()

let number = Suit.allCases.count


//: 8.)
//:
//: Add a third case to `ServerResponse` and to the switch.
//:
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case error(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let error = ServerResponse.error("Why do I Love Tacos")

switch failure {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .error(message):
    print("Error...  \(message)")
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

func getDeckOfCards() -> Array<Card>{
    // create an empty array of cards
    var deckOfCards: [Card] = []
    // iterate the suits
    for suit in Suit.allCases {
        // iterate the ranks
        for index in 1...13 {
            let testme = Rank(rawValue: index)
            deckOfCards.append(Card(rank: testme!, suit: suit))
        }
    }
    return deckOfCards
}

var deckOfCards = getDeckOfCards()
print(deckOfCards.count)
for item in deckOfCards {
    print(item.simpleDescription())
}
