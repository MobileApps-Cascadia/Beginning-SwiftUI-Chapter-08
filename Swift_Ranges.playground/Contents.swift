import SwiftUI

print("Let's explore the range operators built into the Swift language")
print("This is taken from\nhttps://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators#Range-Operators\n")

print("An example of a 'closed range', straight from the docs:")
for index in 1...3 {
    print("\(index) times 5 is \(index * 5)")
}

print("\nWe can also create ranges as objects/values:")
let closedRange = 4...6

for index in closedRange {
    print("\(index) times 5 is \(index * 5)")
}

print("\nHalf-open ranges exclude the right-most value:")
let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0 ..< names.count {
    print("Person at slot \(i) is called \(names[i])")
}
print("* * * Note how we did not crash by attempting to print slot \(names.count) * * *")

print("\nWe can still create half-open ranges as objects:")
let halfOpenRange = 0 ..< names.count
for i in halfOpenRange {
    print("Person at slot \(i) is called \(names[i])")
}

print("\nA 'one sided' range spells out the starting point (and includes the starting point), like so:")
for name in names[2...] {
    print(name)
}

print("\nOr a 'one sided' range spells out the ending point (and includes the ending point), like so:")
for name in names[...2] {
    print(name)
}

print("\nWe can mix half-open and one-sided ranges together:")
for name in names[..<2] {
    print(name)
}
