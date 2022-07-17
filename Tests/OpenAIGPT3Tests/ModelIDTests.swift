//
//  ModelIDTests.swift

import XCTest
@testable import OpenAIGPT3

final class ModelIDTests: XCTestCase {

  func testEncodeToJSON() throws {
    let id: Model.ID = "alpha"
    let json = try jsonEncode(id)
    XCTAssertEqual("\"alpha\"", json)
  }

  func testDecodeFromJSON() throws {
    let id: Model.ID = try jsonDecode("\"alpha\"")
    XCTAssertEqual(Model.ID(value: "alpha"), id)
  }
}