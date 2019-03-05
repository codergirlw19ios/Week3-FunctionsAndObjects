//: ## Functions and Closures
//: 1.)
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//:  Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
func greet(_ person: String, _ lunch: String) -> String {
    return "Hello \(person), today's lunch special is \(lunch)."
}
greet("John", "Red Curry")

//: 2.)
//:
//: Rewrite the closure to return zero for all odd numbers.
//:
var numbers = [20, 19, 7, 12]

//: full "syntactic sugar" form:
var closureNumbers = numbers.map({ (number: Int) -> Int in
    let result = 0
    if number % 2 != 0 {
        return result
    } else {
        return number
    }
})
print(closureNumbers)
//: omitting parameters and return type form:
let mappedNumbers = numbers.map({ number in number % 2 != 0 ? 0: number})
print(mappedNumbers)
//: reference variable form:
let mappedNums = numbers.map { $0 % 2 != 0 ? 0: $0}
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
    let definition = "A 'shape' is simply a geometric figure."
    var numberOfSides = 0
    
    init(definition: String, numberOfSides: Int) {
        self.numberOfSides = numberOfSides
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func areaOfQuadrilaterals(base: Float, height: Float) -> Float{
        return (base * height)
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
    var radius: Float = 3.0
    
    init(radius: Float, name: String){
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Float {
        
        return radius * radius * 3.14
    }
    
    override func simpleDescription() -> String {
        return "A shape with no sides."
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

func compareRank(rank1: Rank, rank2: Rank) -> String {
    if rank1.rawValue == rank2.rawValue {
        return "These cards have the same rank."
    } else if rank1.rawValue > rank2.rawValue {
        return "\(rank1) is greater than \(rank2)."
    } else {
        return "\(rank1) is less than \(rank2)."
    }
}
print(compareRank(rank1: Rank.ace, rank2: Rank.eight))
print(compareRank(rank1: Rank.king, rank2: Rank.ten))

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
let heartsColor = hearts.color()
print(Suit.spades.color())

//: 8.)
//:
//: Add a third case to `ServerResponse` and to the switch.
//:
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case forbidden(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let forbidden = ServerResponse.forbidden("The Restricted Section of the Hogwarts Library")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .forbidden(restricted):
    print("Sorry, it seems like you've stumbled upon \(restricted).")
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

func getDeck() -> [Card] {
    var deckOfCards = [Card]()
    for rank in Rank.allCases {
        for suit in Suit.allCases {
            deckOfCards += [Card(rank: rank, suit: suit)]
        }
    }
    return deckOfCards
}
print(getDeck())
