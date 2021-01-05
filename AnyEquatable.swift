import Foundation

public struct AnyEquatable:
    Equatable
{
    // MARK: - Public properties
    public let base: Any
    
    // MARK: - Private properties
    private let isEqual: (AnyEquatable) -> Bool
    
    // MARK: - Public inits
    public init<E: Equatable>(_ base: E) {
        self.base = base
        self.isEqual = { base == $0.base as? E }
    }
    
    // MARK: - Equatable
    public static func == (
        lhs: AnyEquatable,
        rhs: AnyEquatable)
        -> Bool
    {
        lhs.isEqual(rhs)
    }
}

extension AnyEquatable: CustomStringConvertible {
    public var description: String {
        return String(describing: base)
    }
}

extension AnyEquatable: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "AnyEquatable(" + String(reflecting: base) + ")"
    }
}

extension AnyEquatable: CustomReflectable {
    public var customMirror: Mirror {
        return Mirror(
            self,
            children: ["value": base]
        )
    }
}