/// Represents a value that can be between `0` and `1`.
public struct Penalty: Equatable {
  public let value: Double
  
  public init(_ value: Double) {
    self.value = Self.clamp(value)
  }
}

extension Penalty {
  /// Clamps the value between `-2.0` and `2.0`.
  ///
  /// - Parameter value: The value to clamp.
  /// - Returns the clamped value.
  public static func clamp(_ value: Double) -> Double {
    return min(2.0, max(-2.0, Double(value)))
  }
}

extension Penalty: ExpressibleByFloatLiteral {
  public init(floatLiteral value: Double) {
    self.init(value)
  }
}

extension Penalty: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    try self.init(container.decode(Double.self))
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self.value)
  }
}
