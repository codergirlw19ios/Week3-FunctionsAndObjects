//: ## Functions and Closures
//: 1.)
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//:  Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
func greet(_ person: String, lunchspecial: String) -> String {
    return "Hello \(person), today's lunch special is \(lunchspecial)."
}
greet("John", lunchspecial: "Noodles")

//: 2.)
//:
//: Rewrite the closure to return zero for all odd numbers.
//:
var numbers = [20, 19, 7, 12]

//: full "syntactic sugar" form:
numbers.map({ (number: Int) -> Int in
    if(number % 2 != 0)
    {
        return 0
        
    }
    else
    {
        let result = 3 * number
        return result
        
    }
})
//: omitting parameters and return type form:
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
//: reference variable form:
let mappedNums = numbers.map { 3 * $0 % 2 == 0 ? 3 * $0 :0}
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
    let myvariable = 4
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func argpassing(dimensions:Int) -> Bool {
        var result = true
        if(myvariable == dimensions){
            result = true
        }
        return result
        }
    init(count: Int){
        numberOfSides = count
    }
}
var testclass = Shape(count:4)
testclass.argpassing(dimensions: 4)
testclass.numberOfSides = 2

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
class Circle:NamedShape{
    var radius:Double = 0
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name:name)
    }
    func area() -> Double{
        return Double.pi * radius * radius
    }
    override func simpleDescription() -> String {
        _ = area()
        return "\(name) with \(numberOfSides) sides and a radius of \(radius) and an area of \(area)"
    }
}
let test = Circle(radius : 5, name: "my circle")
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
let ace = Rank.ace
let aceRawValue = ace.rawValue
func rankComparision(r1:Rank, r2:Rank) -> Bool{
    return r1.rawValue == r2.rawValue
}
rankComparision(r1: ace, r2: ace)

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
        switch self{
        case .spades,.clubs:
            return "black"
        case.hearts,.diamonds:
            return "red"
        }
        
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()
Suit.spades.color()

//: 8.)
//:
//: Add a third case to `ServerResponse` and to the switch.
//:
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case myResponse(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let myResponse = ServerResponse.myResponse("This is my Response")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .myResponse(message):
    print("MyResponse... \(message)")
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
func fullDeck() -> [Card] {
    var deck = Array (repeating: Card(rank: .ace, suit: .spades), count: 52)
    let suits = [Suit.spades,Suit.hearts,Suit.diamonds,Suit.clubs]
    var count = 0
    
    for i in 1...13{
        for suit in suits
        {
            deck[count + 1] = Card(rank: Rank(rawValue: Rank.RawValue(i))!, suit: suit)
        }
    }
    return deck
}
func printFullDeck(deck: [Card]){
    for card in deck{
        print(card.simpleDescription())
    }
}
let myDeck = fullDeck()
printFullDeck(deck: myDeck)
