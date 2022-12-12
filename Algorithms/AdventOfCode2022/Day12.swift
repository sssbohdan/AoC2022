//
//  Day12.swift
//  Algorithms
//
//  Created by Bohdan Savych on 12/12/2022.
//

import Foundation

enum AoCDay12 {
    struct Point {
        var x: Int
        var y: Int
    }
    static let alphabet = "a b c d e f g h i j k l m n o p q r s t u v w x y z"
    static let alphabetValues: [Character: Int] = [
        "a": 1,
        "b": 2,
        "c": 3,
        "d": 4,
        "e": 5,
        "f": 6,
        "g": 7,
        "h": 8,
        "i": 9,
        "j": 10,
        "k": 11,
        "l": 12,
        "m": 13,
        "n": 14,
        "o": 15,
        "p": 16,
        "q": 17,
        "r": 18,
        "s": 19,
        "t": 20,
        "u": 21,
        "v": 22,
        "w": 23,
        "x": 24,
        "y": 25,
        "z": 26,
    ]

    static var rows = 0
    static var columns = 0

    static func solve() -> Point {
        let matrix = testInput
            .split(separator: "\n")
            .map { Array(String($0)) }
        self.rows = matrix.count
        self.columns = matrix.first!.count

        let flattenRows = matrix.flatMap { $0 }
        var startIndex = flattenRows.firstIndex(of: "S")!
        let finishIndex = flattenRows.firstIndex(of: "E")!
        var startPoint = indexToPoint(startIndex, columns: columns)
        var currentPoint = startPoint
        let finishPoint = indexToPoint(finishIndex, columns: columns)

        while true {

        }
    }

    static func step(currentPoint: Point, matrix: inout [[Character]]) -> ([Point], Bool) {
        let currentLetter = matrix[currentPoint.x][currentPoint.y]
        let currentLetterValue = alphabetValues[currentLetter] ?? Int.max
        if currentLetter == "E" { return ([], true) }
        if currentLetter == "S" { return ([], false) } // handle
        var points = [Point]()

        let canGoRight = currentPoint.y + 1 < columns
        ? alphabetValues[matrix[currentPoint.x][currentPoint.y + 1]]! - 1 <= currentLetterValue
        : false

        if canGoRight {
            points.append(Point(x: currentPoint.x, y: currentPoint.y + 1))
        }

        let canGoLeft = currentPoint.y - 1 >= 0
            ? alphabetValues[matrix[currentPoint.x][currentPoint.y - 1]]! - 1 <= currentLetterValue
            : false

        if canGoLeft {
            points.append(Point(x: currentPoint.x, y: currentPoint.y - 1))
        }

        let canGoDown = currentPoint.x + 1 < rows
        ? alphabetValues[matrix[currentPoint.x + 1][currentPoint.y]]! - 1 <= currentLetterValue
        : false

        if canGoDown {
            points.append(Point(x: currentPoint.x + 1, y: currentPoint.y))
        }

        let canGoUp = currentPoint.x - 1 >= 0
        ? alphabetValues[matrix[currentPoint.x - 1][currentPoint.y]]! - 1 <= currentLetterValue
        : false

        if canGoUp {
            points.append(Point(x: currentPoint.x - 1, y: currentPoint.y))
        }

        return (points, false)
    }

    static func indexToPoint(_ index: Int, columns: Int) -> Point {
        let row = (index / columns)
        let column = (index % columns)

        return .init(x: row, y: column)
    }

    static func pointToIndex(_ point: Point, columns: Int) -> Int {
        (point.x * columns) + point.y
    }

    static func makeMove() {

    }

    static let testInput = """
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
"""

    static let input = """
"""

}

/*
 You try contacting the Elves using your handheld device, but the river you're following must be too low to get a decent signal.
 You ask the device for a heightmap of the surrounding area (your puzzle input). The heightmap shows the local area from above broken into a grid; the elevation of each square of the grid is given by a single lowercase letter, where a is the lowest elevation, b is the next-lowest, and so on up to the highest elevation, z.
 Also included on the heightmap are marks for your current position (S) and the location that should get the best signal (E). Your current position (S) has elevation a, and the location that should get the best signal (E) has elevation z.
 You'd like to reach E, but to save energy, you should do it in as few steps as possible. During each step, you can move exactly one square up, down, left, or right. To avoid needing to get out your climbing gear, the elevation of the destination square can be at most one higher than the elevation of your current square; that is, if your current elevation is m, you could step to elevation n, but not to elevation o. (This also means that the elevation of the destination square can be much lower than the elevation of your current square.)
 */
