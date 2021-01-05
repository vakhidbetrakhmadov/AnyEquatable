import Foundation
import XCTest

var argv = CommandLine.arguments

let (name, option) = (
    argv.removeFirst(),
    argv.first
)

switch option {
case .none:
    run()
case "--test":
    runTests()
case "--help":
    printHelp(for: name)
case .some(let option):
    printError(for: option)
    printHelp(for: name)
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

func printHelp(for name: String) { 
    print("usage: \(name) [--test] [--help]")
}

func printError(for option: String) { 
    print("error: unknown option `\(option)`")
}