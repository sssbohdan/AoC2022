//
//  AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by Bohdan Savych on 10/10/2022.
//

import XCTest
@testable import Algorithms

final class JimAndJokesTests: XCTestCase {
    let object = JimAndTheJokes()

    override func setUp() {
        super.setUp()

        object.findAllCombinations(month: 12, day: 25)
        print("qwe")
    }

    func testDecimalToOctal() throws {
        XCTAssertEqual(22, object.convertDecimal(number: 18, toSystem: 8))
        XCTAssertEqual(55, object.convertDecimal(number: 45, toSystem: 8))
        XCTAssertEqual(object.convertDecimal(number: 18, toSystem: 7), 24)
    }


    func testConvertFromAnyToDecimal() {
        XCTAssertEqual(object.convertFromAnyToDecimal(number: 21654151, system: 8), 4675689)
        XCTAssertEqual(object.convertFromAnyToDecimal(number: 24, system: 7), 18)
        XCTAssertEqual(object.convertFromAnyToDecimal(number: 22, system: 8), 18)
        XCTAssertEqual(object.convertFromAnyToDecimal(number: 55, system: 8), 45)



    }
}
