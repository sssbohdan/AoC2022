//
//  AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by Bohdan Savych on 10/10/2022.
//

import XCTest
@testable import Algorithms

final class SummingtheNseriesTests: XCTestCase {
    func testSummingtheNseries() throws {
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 5773408242017850), 112242846)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 5025554062339313), 224225402)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 9803332417649065), 27866312)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 4529826640896246), 696985755)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 7633499047094366), 210094750)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 4614556128541569), 364229804)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 8200111660324493), 770629628)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 9428242699249167), 249617754)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 3888311265122983), 321706764)
        XCTAssertEqual(SummingtheNseries().summingSeries(n: 2400440231598721), 69640712)
    }
}
