import Foundation

let (arg1, arg2) = (
    CommandLine.arguments.first,
    CommandLine.arguments.dropFirst().first
)

switch arg2 {
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
    // TODO
    print(#function)
}

func printHelp() { 
    print("usage: \(arg1 ?? "cmd") [--test]")
}