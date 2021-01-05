import Foundation
import XCTest

let (name, arg1) = (
    CommandLine.arguments.first,
    CommandLine.arguments.dropFirst().first
)

switch arg1 {
case .none:
    run()
case "--test":
    runTests()
default:
    printHelp()
}

func run() { 
    let arr1 = [
        AnyEquatable(1),
        AnyEquatable(1.0),
        AnyEquatable(true), 
        AnyEquatable("1"),
    ]
    let arr2 = [
        AnyEquatable(1),
        AnyEquatable(1.0), 
        AnyEquatable(true),
        AnyEquatable("1")
    ]
    
    print(String(reflecting: arr1) + " == " + String(reflecting: arr2))
    print(arr1 == arr2)
}

func runTests() { 
    let testCases: [AnyClass] = [
        AnyEquatableTests.self
    ]

    let testSuites = testCases.map {
        XCTestSuite(forTestCaseClass: $0)
    }

    testSuites.forEach { $0.run() }
}

func printHelp() { 
    print("usage: \(name ?? "cmd") [--test]")
}