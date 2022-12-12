//
//  Day10.swift
//  Algorithms
//
//  Created by Bohdan Savych on 11/12/2022.
//

import Foundation

//Find the signal strength during the 20th, 60th, 100th, 140th, 180th, and 220th cycles. What is the sum of these six signal strengths?
// add - 2 cycles to complete
// nooop - 1 cycle to complete

enum AoCDay10 {
    enum Command {
        case noop
        case addx(Int)

        var digit: Int {
            switch self {
            case .noop:
                return 0
            case .addx(let a):
                return a
            }
        }

        init(string: String) {
            let split = string.split(separator: " ")
            let cmd = String(split[0])
            switch cmd {
            case "noop":
                self = .noop
            case "addx":
                self = .addx(Int(String(split[1]))!)
            default:
                fatalError()
            }
        }
    }

    static func solve() -> Int {
        let commands = input.split(separator: "\n")
            .map { String($0) }
            .map(Command.init(string:))

        var cycles = 0
        var commandIndex = 0
        var value = 1 // sprite
        var isCommand = false
        var signalStrength = 0
        var matrix = Array(repeating: Array(repeating: "", count: 40), count: 6)
        while cycles < 240 {
            cycles += 1
            let row = (cycles - 1) / 40
            let column = (cycles - 1) % 40
            let command = commands[commandIndex]

            if isCommand {
                commandIndex += 1
//                if cycles == 20 || cycles == 60 || cycles == 100 || cycles == 140 || cycles  == 180 || cycles == 220 {
//                    signalStrength += (value * cycles)
//                    print("\(value * cycles) at \(cycles)")
//                }
                let symbol = (value - 1)...(value + 1) ~= column ? "#" : "."
                matrix[row][column] = symbol
                print("row \(row) column \(column)")
                value += command.digit
                isCommand = false
                continue
            } else {
//                if cycles == 20 || cycles == 60 || cycles == 100 || cycles == 140 || cycles  == 180 || cycles == 220 {
//                    signalStrength += (value * cycles)
//                    print("\(value * cycles) at \(cycles)")
//                }
                let symbol = (value - 1)...(value + 1) ~= column ? "#" : "."
                matrix[row][column] = symbol
                print("row \(row) column \(column)")
            }

            switch command {
            case .addx:
                isCommand = true
            case .noop:
                isCommand = false
                commandIndex += 1
            }
        }

        print("signalStrength \(signalStrength)")
        for arr in matrix {
            print(arr.joined(separator: ""))
        }
        return signalStrength
    }

    static let input = """
addx 1
noop
addx 29
addx -24
addx 4
addx 3
addx -2
addx 3
addx 1
addx 5
addx 3
addx -2
addx 2
noop
noop
addx 7
noop
noop
noop
addx 5
addx 1
noop
addx -38
addx 21
addx 8
noop
addx -19
addx -2
addx 2
addx 5
addx 2
addx -12
addx 13
addx 2
addx 5
addx 2
addx -18
addx 23
noop
addx -15
addx 16
addx 7
noop
noop
addx -38
noop
noop
noop
noop
noop
noop
addx 8
addx 2
addx 3
addx -2
addx 4
noop
noop
addx 5
addx 3
noop
addx 2
addx 5
noop
noop
addx -2
noop
addx 3
addx 6
noop
addx -38
addx -1
addx 35
addx -6
addx -19
addx -2
addx 2
addx 5
addx 2
addx 3
noop
addx 2
addx 3
addx -2
addx 2
noop
addx -9
addx 16
noop
addx 9
addx -3
addx -36
addx -2
addx 11
addx 22
addx -28
noop
addx 3
addx 2
addx 5
addx 2
addx 3
addx -2
addx 2
noop
addx 3
addx 2
noop
addx -11
addx 16
addx 2
addx 5
addx -31
noop
addx -6
noop
noop
noop
noop
noop
addx 7
addx 30
addx -24
addx -1
addx 5
noop
noop
noop
noop
noop
addx 5
noop
addx 5
noop
addx 1
noop
addx 2
addx 5
addx 2
addx 1
noop
noop
noop
noop

"""


    static let testInput = """
addx 15
addx -11
addx 6
addx -3
addx 5
addx -1
addx -8
addx 13
addx 4
noop
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx -35
addx 1
addx 24
addx -19
addx 1
addx 16
addx -11
noop
noop
addx 21
addx -15
noop
noop
addx -3
addx 9
addx 1
addx -3
addx 8
addx 1
addx 5
noop
noop
noop
noop
noop
addx -36
noop
addx 1
addx 7
noop
noop
noop
addx 2
addx 6
noop
noop
noop
noop
noop
addx 1
noop
noop
addx 7
addx 1
noop
addx -13
addx 13
addx 7
noop
addx 1
addx -33
noop
noop
noop
addx 2
noop
noop
noop
addx 8
noop
addx -1
addx 2
addx 1
noop
addx 17
addx -9
addx 1
addx 1
addx -3
addx 11
noop
noop
addx 1
noop
addx 1
noop
noop
addx -13
addx -19
addx 1
addx 3
addx 26
addx -30
addx 12
addx -1
addx 3
addx 1
noop
noop
noop
addx -9
addx 18
addx 1
addx 2
noop
noop
addx 9
noop
noop
noop
addx -1
addx 2
addx -37
addx 1
addx 3
noop
addx 15
addx -21
addx 22
addx -6
addx 1
noop
addx 2
addx 1
noop
addx -10
noop
noop
addx 20
addx 1
addx 2
addx 2
addx -6
addx -11
noop
noop
noop
"""
}
