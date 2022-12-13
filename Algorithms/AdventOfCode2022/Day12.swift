//
//  Day12.swift
//  Algorithms
//
//  Created by Bohdan Savych on 12/12/2022.
//

import Foundation


// TODO: Fix with Deykstra alg
enum AoCDay12 {
    struct Point {
        var x: Int
        var y: Int
    }

    struct RouteData {
        let path: IndexSet
        let foundPivot: Bool
        let currentPoint: Point
    }
    static let alphabet = "a b c d e f g h i j k l m n o p q r s t u v w x y z"
    static let alphabetValues: [Character: Int] = [
        "S": 0,
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
        "E": 27
    ]

    static var rows = 0
    static var columns = 0

    static func solve() -> Int {
        var matrix = input
            .split(separator: "\n")
            .map { Array(String($0)) }
        self.rows = matrix.count
        self.columns = matrix.first!.count

        let flattenRows = matrix.flatMap { $0 }
        let startIndex = flattenRows.firstIndex(of: "S")!
        let startPoint = indexToPoint(startIndex, columns: columns)
        let currentPoint = startPoint
        var possibleRoutes = goDown(.init(path: .init(), foundPivot: false, currentPoint: currentPoint), matrix: &matrix)
        var shortest: RouteData?
        while !possibleRoutes.isEmpty {
            let r = popTheShortest(&possibleRoutes, final: &shortest)

            if shortest != nil {
                print("-----------------------")
                printShortestRoute(shortest!.path, matrix: matrix)
                print("-----------------------")
                print("\(shortest!.path.count - 1)")
                return shortest!.path.count - 1
            }

            let possibles = goDown(r, matrix: &matrix)
            possibleRoutes.append(contentsOf: possibles)
        }

        fatalError()
    }

    static func popTheShortest(_ arr: inout [RouteData], final: inout RouteData?) -> RouteData {
        let shortest = Int.max
        var shortestRoute: RouteData?
        var shortestIndex: Int?

        for (index, route) in arr.enumerated() {
            if route.foundPivot {
                final = route
            }
            if route.path.count < shortest {
                shortestRoute = route
                shortestIndex = index
            }
        }

        arr.remove(at: shortestIndex!)

        return shortestRoute!
    }

    static func goDown(_ routeData: RouteData, matrix: inout [[Character]]) -> [RouteData] {
        let currentPoint = routeData.currentPoint
        let currentPath = routeData.path
        let currentLetter = matrix[currentPoint.x][currentPoint.y]
        let currentLetterValue = alphabetValues[currentLetter] ?? 0

        let canGoUp = currentPoint.x - 1 >= 0
        ? alphabetValues[matrix[currentPoint.x - 1][currentPoint.y]]! - 1 <= currentLetterValue
        : false

       var routes = [RouteData]()

        if
            canGoUp,
            !currentPath.contains(pointToIndex(Point(x: currentPoint.x - 1, y: currentPoint.y), columns: columns)) {
            let point = Point(x: currentPoint.x - 1, y: currentPoint.y)
            var currentPath = currentPath
            let letter = matrix[point.x][point.y]
            currentPath.insert(pointToIndex(point, columns: columns))
            let data = RouteData(path: currentPath, foundPivot: letter == "E", currentPoint: point)
            routes.append(data)
        }

        let canGoRight = currentPoint.y + 1 < columns
        ? alphabetValues[matrix[currentPoint.x][currentPoint.y + 1]]! - 1 <= currentLetterValue
        : false

        if
            canGoRight,
            !currentPath.contains(pointToIndex(Point(x: currentPoint.x, y: currentPoint.y + 1), columns: columns)) {
            let point = Point(x: currentPoint.x, y: currentPoint.y + 1)
            var currentPath = currentPath
            let letter = matrix[point.x][point.y]
            currentPath.insert(pointToIndex(point, columns: columns))
            let data = RouteData(path: currentPath, foundPivot: letter == "E", currentPoint: point)
            routes.append(data)
        }

        let canGoDown = currentPoint.x + 1 < rows
        ? alphabetValues[matrix[currentPoint.x + 1][currentPoint.y]]! - 1 <= currentLetterValue
        : false

        if
            canGoDown,
            !currentPath.contains(pointToIndex(Point(x: currentPoint.x + 1, y: currentPoint.y), columns: columns)) {
            let point = Point(x: currentPoint.x + 1, y: currentPoint.y)
            var currentPath = currentPath
            let letter = matrix[point.x][point.y]
            currentPath.insert(pointToIndex(point, columns: columns))
            let data = RouteData(path: currentPath, foundPivot: letter == "E", currentPoint: point)
            routes.append(data)        }

        let canGoLeft = currentPoint.y - 1 >= 0
        ? alphabetValues[matrix[currentPoint.x][currentPoint.y - 1]]! - 1 <= currentLetterValue
        : false

        if
            canGoLeft,
            !currentPath.contains(pointToIndex(Point(x: currentPoint.x , y: currentPoint.y - 1), columns: columns)) {
            let point = Point(x: currentPoint.x, y: currentPoint.y - 1)
            var currentPath = currentPath
            let letter = matrix[point.x][point.y]
            currentPath.insert(pointToIndex(point, columns: columns))
            let data = RouteData(path: currentPath, foundPivot: letter == "E", currentPoint: point)
            routes.append(data)
        }

        return routes
    }

    static func indexToPoint(_ index: Int, columns: Int) -> Point {
        let row = (index / columns)
        let column = (index % columns)

        return .init(x: row, y: column)
    }

    static func pointToIndex(_ point: Point, columns: Int) -> Int {
        (point.x * columns) + point.y
    }

    static func printShortestRoute(_ route: IndexSet, matrix: [[Character]]) {
        for (r, row) in matrix.enumerated() {
            var acc = ""
            for (c, character) in row.enumerated() {
                let index = pointToIndex(.init(x: r, y: c), columns: columns)
                acc.append(route.contains(index) ? " \(character) " :" • ")
            }

            print(acc)
        }
    }

    static func printMatrix(_ matrix: [[Character]]) {
        for r in matrix {
                print(String(r))
        }
    }

    static let testInput = """
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
"""

    static let input = """
abcccccccaaaaaaaaccccccccccaaaaaaccccccaccaaaaaaaccccccaacccccccccaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaa
abcccccccaaaaaaaaacccccccccaaaaaacccccaaacaaaaaaaaaaaccaacccccccccccaaaaaaccccccccccccccccccccccccccccccccccaaaaa
abcccccccaaaaaaaaaaccccccccaaaaaacaaacaaaaaaaaaaaaaaaaaaccccccccccccaaaaaaccccccccccccccaaacccccccccccccccccaaaaa
abaaacccccccaaaaaaacccccccccaaacccaaaaaaaaaaaaaaaaaaaaaaaaacccccccccaaaaaaccccccccccccccaaacccccccccccccccccaaaaa
abaaaaccccccaaaccccccccccccccccccccaaaaaaaaacaaaacacaaaaaacccccccccaaaaaaaacccccccccccccaaaaccaaacccccccccccaccaa
abaaaaccccccaaccccaaccccccccccccccccaaaaaaacaaaaccccaaaaaccccccccccccccccacccccccccccccccaaaaaaaaacccccccccccccca
abaaaaccccccccccccaaaacccccccccaacaaaaaaaacccaaacccaaacaacccccccccccccccccccccccccccciiiiaaaaaaaacccccccccccccccc
abaaacccccccccccaaaaaacccccccccaaaaaaaaaaacccaaacccccccaacccccccccccaacccccccccccccciiiiiiijaaaaccccccccaaccccccc
abaaaccccccccccccaaaacccccccccaaaaaaaacaaacccaaaccccccccccccccccccccaaacaaacccccccciiiiiiiijjjacccccccccaaacccccc
abcccccaacaacccccaaaaaccccccccaaaaaacccccacaacccccccccccccccccccccccaaaaaaaccccccciiiinnnoijjjjjjjjkkkaaaaaaacccc
abcccccaaaaacccccaacaaccccccccccaaaacccaaaaaaccccccccccccccccccccccccaaaaaaccccccciiinnnnooojjjjjjjkkkkaaaaaacccc
abccccaaaaacccccccccccccccccccccaccccccaaaaaaaccccccccccccccccccccaaaaaaaaccccccchhinnnnnoooojjooopkkkkkaaaaccccc
abccccaaaaaaccccccccccccccccccccccccccccaaaaaaacccccccccccccccccccaaaaaaaaacccccchhhnnntttuooooooopppkkkaaaaccccc
abccccccaaaaccccccccccacccccccccccccccccaaaaaaacccaaccccccccccccccaaaaaaaaaaccccchhhnnttttuuoooooppppkkkaaaaccccc
abccccccaccccccccccccaaaacaaaccccccccccaaaaaacaaccaacccaaccccccccccccaaacaaacccchhhnnnttttuuuuuuuuupppkkccaaccccc
abccccccccccccccaaccccaaaaaaaccccccccccaaaaaacaaaaaacccaaaaaaccccccccaaacccccccchhhnnntttxxxuuuuuuupppkkccccccccc
abcccccccccccccaaaacccaaaaaaacccaccccccccccaaccaaaaaaacaaaaaaccccccccaacccaaccchhhhnnnttxxxxuuyyyuupppkkccccccccc
abcccccccccccccaaaaccaaaaaaaaacaaacccccccccccccaaaaaaaaaaaaaccccccccccccccaaachhhhmnnnttxxxxxxyyyuvppkkkccccccccc
abcccccccccccccaaaacaaaaaaaaaaaaaaccccccccccccaaaaaacaaaaaaaccccccccccccccaaaghhhmmmttttxxxxxyyyyvvpplllccccccccc
abccacccccccccccccccaaaaaaaaaaaaaaccccccccccccaaaaaacccaaaaaacccaacaacccaaaaagggmmmttttxxxxxyyyyvvppplllccccccccc
SbaaaccccccccccccccccccaaacaaaaaaaacccccccccccccccaacccaaccaacccaaaaacccaaaagggmmmsttxxxEzzzzyyvvvppplllccccccccc
abaaaccccccccccccccccccaaaaaaaaaaaaacaaccccccccccccccccaaccccccccaaaaaccccaagggmmmsssxxxxxyyyyyyvvvqqqlllcccccccc
abaaacccccccccccccccccccaaaaaaaaaaaaaaaaacccccccccccccccccccccccaaaaaaccccaagggmmmsssxxxwywyyyyyyvvvqqlllcccccccc
abaaaaacccccccccccccccccccaacaaaccaaaaaaacccccccccccccccccccccccaaaaccccccaagggmmmssswwwwwyyyyyyyvvvqqqllcccccccc
abaaaaaccccccccccccccccccccccaaaccccaaaacccccccccccccccccaaccaacccaaccccccccgggmmmmssssswwyywwvvvvvvqqqlllccccccc
abaaaaacccccccccccccaccacccccaaaccccaaaacccccccccccccccccaaaaaacccccccccccaaggggmllllsssswwywwwvvvvqqqqlllccccccc
abaaccccccccccccccccaaaaccccccccccccaccaccccccccccccccccccaaaaacccccccccccaaagggglllllssswwwwwrrqqqqqqmmllccccccc
abaaccccccccccccccccaaaaaccccccaaccaaccccccccccccccccccccaaaaaaccaacccccccaaaaggfffllllsswwwwrrrrqqqqqmmmcccccccc
abacaaaccccccccccccaaaaaaccccccaaaaaaccccccaacccccccccccaaaaaaaacaaacaaccccaaaaffffflllsrrwwwrrrmmmmmmmmmcccccccc
abaaaaaccccccccccccaaaaaaccccccaaaaaccccccaaaaccccccccccaaaaaaaacaaaaaaccccaaaaccfffflllrrrrrrkkmmmmmmmccccaccccc
abaaaacccccccccccccccaaccccccccaaaaaacccccaaaacccccccccccccaaccaaaaaaaccccccccccccffflllrrrrrkkkmmmmmccccccaccccc
abaaacccccccccccccccccccccccccaaaaaaaaccccaaaacccccccccccccaaccaaaaaaacccccccccccccfffllkrrrkkkkmddddcccccaaacccc
abaaacccccccccccccccccccccccccaaaaaaaacccccccccccccccccccccccccccaaaaaaccccccccccccfffllkkkkkkkdddddddcaaaaaacccc
abaaaacccccccccccccccccccccccccccaaccccccccccccccccccccccccccccccaacaaacccccccccccccfeekkkkkkkddddddcccaaaccccccc
abcaaacccccccccccaaaccccccccaacccaaccccaaaaaccccaaaccccccccccccccaaccccccccccccccccceeeeekkkkdddddccccccaaccccccc
abccccccccccccccaaaaaaccccccaaacaaccacaaaaaaaccaaaaccccccccccaccaaccccccccccccccccccceeeeeeeedddacccccccccccccccc
abccccccccccccccaaaaaacccccccaaaaacaaaaaccaaaaaaaacccccccccccaaaaacccccccccccccccccccceeeeeeedaaacccccccccccccaaa
abccccccaaacccccaaaaacccccccaaaaaacaaaaaaaaaaaaaaaccccccccccccaaaaaccccccccccccccccccccceeeeecaaacccccccccccccaaa
abccccccaaaccccccaaaaacccccaaaaaaaaccaaaaacaaaaaaccccccccccccaaaaaacccccccccccccccccccccaaaccccaccccccccccccccaaa
abccccaacaaaaacccaaaaacccccaaaaaaaacaaaaaaaaaaaaaaaccccaaaaccaaaacccccccccccccccccccccccaccccccccccccccccccaaaaaa
abccccaaaaaaaaccccccccccccccccaaccccaacaaaaaaaaaaaaaaccaaaaccccaaacccccccccccccccccccccccccccccccccccccccccaaaaaa
"""
}

/*
 You try contacting the Elves using your handheld device, but the river you're following must be too low to get a decent signal.
 You ask the device for a heightmap of the surrounding area (your puzzle input). The heightmap shows the local area from above broken into a grid; the elevation of each square of the grid is given by a single lowercase letter, where a is the lowest elevation, b is the next-lowest, and so on up to the highest elevation, z.
 Also included on the heightmap are marks for your current position (S) and the location that should get the best signal (E). Your current position (S) has elevation a, and the location that should get the best signal (E) has elevation z.
 You'd like to reach E, but to save energy, you should do it in as few steps as possible. During each step, you can move exactly one square up, down, left, or right. To avoid needing to get out your climbing gear, the elevation of the destination square can be at most one higher than the elevation of your current square; that is, if your current elevation is m, you could step to elevation n, but not to elevation o. (This also means that the elevation of the destination square can be much lower than the elevation of your current square.)
 */
