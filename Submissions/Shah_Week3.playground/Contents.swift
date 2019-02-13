//: ## Functions and Closures
//: 1.)
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//:  Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

func lunchSpl(_ person: String,customLabel item: String) -> String {
    return "Hello \(person), today's lunch special is \(item)."
}
lunchSpl("Billy", customLabel: "Bean Burrito")

//: 2.)
//:
//: Rewrite the closure to return zero for all odd numbers.
//:
var numbers = [20, 19, 7, 12]

//: full "syntactic sugar" form:
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
//: omitting parameters and return type form:
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
//: reference variable form:
let mappedNums = numbers.map { 3 * $0 }
print(mappedNums)

//: full "syntactic sugar" form:
numbers.map({ (number: Int) -> Int in
    if (number%2 != 0){
        return 0}
    else{
        return number}
})
//: omitting parameters and return type form:
let mappedNumbers1 = numbers.map({ number in number%2 != 0 ? 0:number})
print(mappedNumbers1)
//: reference variable form:
let mappedNums1 = numbers.map { $0%2 != 0 ? 0: $0 }
print(mappedNums1)

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
    let pie = 3.1427
    
    init(numberOfSides: Int) {
        self.numberOfSides = numberOfSides
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func calculateAreaOfSquare(side:Int) -> String {
        return "Area of square is \(side*side)"
    }
}

var shape = Shape(numberOfSides:4)
var area = shape.calculateAreaOfSquare(side: 20)
var shapeDescription = shape.simpleDescription()
print(shapeDescription)
print(area)

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
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
}
let test = Circle(radius: 10, name: "my circle")
test.area()
test.simpleDescription()

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
let ace = Rank.three
let aceRawValue = ace.rawValue

func compare(value1:Rank, value2:Rank) -> String {
    var result:Rank = value1
    
    if (value2.rawValue > value1.rawValue) {
        result = value2
    }
    
    return "Higher value is \(result.simpleDescription())"
}

compare(value1: Rank.jack, value2: Rank.three)

//: 7.)
//:
//: Add a `color()` method to `Suit` that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
//:
enum Suit {
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
    
    func color() -> String{
        switch self {
        case .spades,.clubs:
            return "black"
        default:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

let clubs = Suit.clubs
let clubsDesc = clubs.simpleDescription()
let clubsColor = clubs.color()



//: 8.)
//:
//: Add a third case to `ServerResponse` and to the switch.
//:
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case freeze(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let freeze = ServerResponse.freeze("Hold on")

switch freeze {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .freeze(message):
    print("Working on it... \(message)")
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

func getCardDeck() -> Array<String> {
    var cardDeck = Array(repeating: "", count: 52)
    let suits = [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs]
    var counter:Int = 0
    for i in 1...13 {
        for suit in suits {
            let card = Card (rank:Rank(rawValue: i)!, suit: suit)
            cardDeck[counter] = card.simpleDescription()
            counter+=1
        }
    }
    return cardDeck
}
var cards = getCardDeck()
print(cards)


