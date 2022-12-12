//
//  Day2.swift
//  Algorithms
//
//  Created by Bohdan Savych on 02/12/2022.
//

import Foundation

enum AoCDay2 {
    enum Choice: Character {
        case rock = "A"
        case paper = "B"
        case scissors = "C"

        var score: Int {
            switch self {
            case .rock:
                return 1
            case .paper:
                return 2
            case .scissors:
                return 3
            }
        }

        func choice(for outcome: Outcome) -> Choice {
            switch (self, outcome) {
            case (.rock, .lost):
                return .scissors
            case (.rock, .draw):
                return .rock
            case (.rock, .won):
                return .paper
            case (.paper, .lost):
                return .rock
            case (.paper, .draw):
                return .paper
            case (.paper, .won):
                return .scissors
            case (.scissors, .lost):
                return .paper
            case (.scissors, .draw):
                return .scissors
            case (.scissors, .won):
                return .rock
            }
        }
    }

    enum Outcome: Character {
        case lost = "X"
        case draw = "Y"
        case won = "Z"

        var score: Int {
            switch self {
            case .lost:
               return  0
            case .draw:
                return 3
            case .won:
                return 6
            }
        }
    }

    static func getPoints(for round: String) -> Int {
        let array = Array(round)
        let outcome = Outcome(rawValue: array[2])!
        let opponentChoice = Choice(rawValue: array[0])!
        let ourChoice = opponentChoice.choice(for: outcome)

        return ourChoice.score + outcome.score
    }

    static func solve() -> Int {
        let score = input.split(separator: "\n")
            .map { getPoints(for: String($0)) }
            .reduce(0, +)

        return score
    }

    static let input = """
A Z
C X
A Z
A Z
C Y
C Y
A Z
A Y
C Y
A Y
A Z
A Z
A Z
A Y
A Z
A Y
C Y
C X
A Y
C Y
C Y
C X
A Z
C Y
C X
A X
A Y
A Z
A Y
A Y
C X
C X
B Y
C X
C X
A Y
A Z
A Z
A X
A Z
A Z
C Y
A Z
A Z
A Y
C X
C Y
C X
B X
C Z
A Y
A Z
A Z
A Z
A Y
A Y
C X
A Y
A Z
C Y
A Y
A Y
A Z
A Z
C Y
A Z
C Y
A Y
A Z
A Z
C Y
B Z
A Z
A Z
A Z
A Z
C X
C X
A Y
A X
A Y
A Z
A Z
C X
A Z
C X
A Z
C Y
C X
A Z
A Z
A Z
A Z
C X
C Y
A Z
A Z
C Y
A Z
B Z
C X
A Z
A X
C X
A Z
C Z
A Z
C X
A Z
A Y
C X
C Z
A Z
C X
C Y
A Z
B Z
B Y
A X
A X
A X
A Z
A Z
A X
A Z
A X
A Z
A Z
C X
C X
B Z
A Z
A Y
A Z
A Z
A Z
A Z
C X
C X
C X
A Z
A Z
A Z
A Z
A X
A Y
A Y
C X
C X
B Z
C X
A X
A Z
A Z
C X
C Z
A Z
A Z
C Y
A X
A Z
C Y
A X
A Y
A Y
A Y
C Y
A Z
A Z
C X
C X
C X
C X
B Z
C Y
C X
C X
A Y
A Y
A Z
A Z
A X
C X
A Z
B Z
A Z
C X
A Y
A Z
A Z
A Y
A Y
A Z
C X
A Y
C X
C X
A Z
A Y
C X
A Z
A Z
A Y
A Z
A Z
C Y
C Z
A Y
A Z
C X
C X
A Z
A Z
C Y
A Y
A Z
A Y
A Z
C X
A Z
A Z
C X
A Y
A Y
C Y
A Z
C Y
A Z
A Z
C Y
A Y
B Z
C Y
C X
C X
A Z
C Y
A X
C Y
A Z
A Y
A Z
C X
C X
C Y
C Y
A Y
A Z
C X
C X
A Y
A X
A Y
B Z
A Y
C Y
C X
C X
A X
C X
B Z
A X
C Y
C X
C X
A X
A Z
B Z
A Z
A Z
A Y
A X
A Z
C X
A X
C Y
A Z
A Z
A X
A Z
A Z
C X
C X
A Z
A Z
A Z
A X
A Z
A X
B Y
A Z
A Y
C Y
A Z
C X
A Z
C X
A Y
A Z
C X
C Y
A Y
C Y
A Z
C X
A Z
A Z
C X
A Y
A Z
A X
A Z
A Z
A Z
B Y
C X
A X
A Z
A Z
C Y
C Y
C X
C X
C X
A X
A X
A Z
A X
A Y
A Z
A Y
A Z
C Y
C Z
A Y
A Z
A Z
A X
A Z
A Z
C X
C Y
A Y
C X
C X
A Z
C X
C X
C X
A X
A Z
A Z
A Z
A Z
B Y
A Y
A Y
A Z
C X
A Y
A Z
C X
A Z
C Z
A Y
C X
A Z
B Z
A Y
A X
A Z
C X
A Z
A Z
A Z
A Z
A Z
B Z
A Z
C X
A Y
C X
A Z
A Z
A Y
A Z
B Z
C X
A Y
C Y
A Z
A Z
C X
C X
A Y
C X
C Y
B Z
A Y
C X
A Y
C X
A X
A Y
A Z
A Z
A Y
C X
A X
C X
B Y
A Z
A Y
B Y
A Y
C X
A Z
A Z
C X
C Y
A Y
C X
C Y
A Y
A Z
A X
B Z
C X
A Z
A Y
A Z
B Z
A Z
A X
C Y
A X
A Z
A Y
C Y
A Z
C Y
A Z
C X
C X
A Y
C X
C X
A Y
A Z
A Z
A Y
A X
C Y
A Z
A Z
C X
A X
A Z
C Z
A Z
C Y
A Z
C X
A Z
A Z
A X
C X
C X
C Y
B Z
B Y
C Y
A Y
A X
A Z
C X
A Y
A Y
A Z
A Z
C Z
C X
C X
C X
A Z
C X
A Z
A Z
A Y
C Y
C X
C X
C X
A Y
C X
B Z
C X
A Z
C Y
A Y
C Y
A Z
A Z
C X
A X
A Z
A Y
A Z
B X
C Z
A Z
C Z
A X
C X
C X
C X
C X
A Z
A Y
A Z
A Z
A Z
A Z
A Z
C Z
C Y
C Y
C X
C Y
A Z
C X
C X
A Z
A Z
C X
C Y
C Y
A Z
A X
C Y
C Y
C X
A Y
C X
A Z
A Z
A Y
C Y
A Y
C X
C X
A Z
A Z
C Y
A Z
C X
A Y
A Y
A Z
C Y
A Z
C X
A Y
A Z
A Z
A Z
A Z
C Y
A Y
C Y
A Z
A Z
A X
A Y
A Y
A Z
C Y
A Z
A X
A Z
B Z
C X
C X
C Y
A Z
A Z
C X
C Z
A Z
C X
C Y
A Z
B Z
A Z
B Z
A X
A Y
A Z
A Z
A Z
A Z
C Y
A Z
A Z
A Z
B Z
A Z
C X
C X
A Z
C X
A X
A Z
A Y
A Y
A X
A Z
A Z
A Z
A Z
B Z
A Z
C Y
C Y
C X
C X
B Z
C Y
A Z
C Y
A Z
A Y
C Y
A X
A Y
C X
A Y
C X
A Z
A Z
B Z
A Y
C Y
C X
A Z
A Z
C X
A Y
A Z
A Z
A X
A Y
A Y
A Y
A Z
A Y
A Z
C X
A X
A Z
A Z
C Y
A Z
C X
A Z
C Y
A Y
A Z
A Z
A Z
A Z
C Y
A X
A Z
A Z
A Y
A Z
B Z
A X
A Y
C X
C X
A Y
A Z
C Y
A Z
A Y
A Y
A Z
A Y
A Y
A Z
A Z
A Z
C X
A Z
A Y
A Z
A Z
C Y
A Z
C X
A Y
C X
C Y
A Z
C Y
A Z
A Y
C Y
C Y
A Z
C X
C X
C X
A Z
A Z
A Y
C X
A Z
A X
A Z
A Z
C X
A Z
C Y
A Y
A Z
A Y
A Z
A Z
C Y
A Z
C X
A Z
A X
A Z
A Z
C X
A Z
A Z
C Y
C X
A Z
C Y
C X
C X
A Z
A Z
A Z
A X
C X
A Z
A Z
C Y
A Y
C X
A Y
C X
C Y
A Y
A Z
C X
A Z
B Y
A X
B Z
A Y
A X
C Y
A Z
A X
A Z
A Z
C Y
A Z
B Z
C X
C X
B Y
A Z
A Z
A Z
C Y
C X
A Z
A Y
A Y
A Y
C Y
C X
A Z
A X
A X
A X
A Z
A Z
A Z
A Z
C X
C X
A Z
C X
A Y
C X
B Z
A Z
A Z
C X
A Z
C X
C X
C X
A Y
C Y
C X
A Y
C X
C Y
B Z
A Z
C X
A Z
A X
B Z
A Y
B Y
A Z
A Z
A X
A Z
A X
A Z
A Z
C X
C Y
A X
C Y
C X
A Z
A Z
A Z
C Y
A X
A Y
A Z
A Y
C X
B Z
A Z
A Y
C Z
C X
A Z
A Z
A Z
B Z
A X
C X
A Z
A Z
B Z
A Z
A Z
B Z
A Z
C X
A Z
C X
A Z
C X
A Z
C Y
A Z
A X
A Y
A Y
C X
A Y
C X
B Z
A Z
A Z
A Z
A Z
C X
A Z
C X
A Z
A Y
A Z
B Z
A Y
C Z
A Y
C X
A Z
A Z
A Y
B Z
A X
C Y
A Z
A Y
A Z
A Y
A Y
A Z
A Z
A Z
A X
A Z
C Y
A Y
A X
A Y
C X
A Y
C X
A X
C X
A Z
C Y
A Y
A Z
A Z
A X
A Y
C X
C X
A Y
A X
A Z
B Z
A Y
A Z
A X
A Z
B Y
A Y
A Y
A Z
C X
A Z
A Z
A Y
A Z
C Z
A Z
A Z
A Z
A Z
C Y
C Y
A Y
B Z
C Y
A Y
C Y
A Z
A Z
A Z
A Z
C Y
A Z
A Z
C Y
C X
A Y
A Y
A Z
C X
C Z
C X
C X
A Z
A Z
A Y
A Z
A X
C Y
A Z
A Z
C Y
C X
A X
A Z
A Z
A X
C X
C X
C X
A Z
A X
C X
C Y
A X
A Z
C X
A Z
A Z
C X
A Y
A Z
A Z
A Y
A Z
C X
A Z
A Z
C X
A Y
A Z
A Z
C X
A Z
A Y
A Z
C Y
A X
A Z
A Z
C X
A Z
A Y
C Y
B Z
A Z
A Y
C X
A Z
B Z
A Z
C Z
A X
A Z
A Z
C Y
A Z
A Y
C X
C Y
A Z
A Z
A Y
A X
C Y
A Y
C X
C Y
A Z
C Y
A Z
C X
A Z
A Z
A X
A Z
A Z
B X
A X
A Z
C Y
A Z
A X
C X
A Z
A Z
C X
C Y
C Y
A X
A Y
C Y
A Y
A Z
A Z
A Z
A Z
A Y
C X
C X
C Y
C X
A Z
A X
B Z
B Y
C X
C Y
A Y
A Z
A Y
C X
C Z
A Z
A Y
C Y
C X
A Z
A Z
A Y
C X
C Z
C Y
A Z
C X
C Y
A X
A X
A Y
A Z
B Z
A X
A Y
A Y
C X
C Y
A Z
A X
A Z
A X
A Y
A Z
A Z
A Z
C X
A Z
A Z
A Z
C Z
C Y
C Y
A Z
C Y
C Y
C Y
C X
A Z
C X
C X
A Z
A Y
A Z
A Z
A X
A Y
A Y
C X
C X
A Z
A Z
A Z
A Z
A Y
A Z
A Z
A Z
A Z
A X
A X
A Y
A X
C Y
A Y
A Z
C X
A Y
A Y
A Z
A Z
A Z
C X
A Z
C X
C X
C Y
A Y
A Z
A Y
A Z
C X
C X
A Z
A Z
A Z
C X
A X
A Z
A Z
C Y
C Y
A Y
A Y
A Z
A Z
C Y
C X
C Y
A X
C Y
C X
C Y
A Z
A Z
A X
C Y
C Y
A Z
A Y
C X
A X
B Z
A Z
C X
A Y
A X
A Z
A Z
A Z
C Y
C X
A Z
C X
A Z
A Z
A Y
A Z
A Y
A X
A Z
C Z
A Z
A Z
A Z
A X
A Z
A X
C X
A Z
A Z
C Y
A X
A Z
C X
C X
A Y
A Z
A Z
C X
B X
A Z
C Y
A Z
C X
A Y
A Z
C X
A X
A Z
A X
A Z
C X
A Z
A X
A Z
C X
C Y
A Y
A X
A X
A Z
C Y
C Y
A Y
A Y
A Y
A X
A Z
A Z
A Z
C Y
C Y
A Y
B X
B X
A Z
C X
C X
A Z
C Y
C X
A Z
A Z
A Z
A Z
C X
A Z
A Z
C Y
A Y
C Y
A Z
C Y
C Y
A Z
C X
A Z
A X
A Z
C X
C X
A Y
B Z
A Y
C Y
A Z
C Y
A X
C X
A Y
C X
A Z
C Z
C Y
A Z
C X
C Y
A Z
A X
A Z
A Z
A Z
C X
A Z
A Z
A Z
A Z
A Z
A Z
A Z
A Z
A Z
A Y
A Z
A X
A Y
C Y
B Y
C X
B Z
A Z
A Z
A Y
B Z
A Z
A Z
C X
C Y
C X
A Y
A X
C X
C Y
A Y
C X
C Y
A Z
A Z
A Z
A Y
C X
A Y
C X
B Z
A Z
A Y
A Z
A Z
A Y
C X
A Z
C X
C Y
A Y
A Z
B Z
C X
A Y
C X
A Y
A Z
C X
A X
C X
B Y
C X
A Z
A Y
A Z
A Y
A X
C X
C X
A Y
C X
A Y
A Y
A X
B Y
A Y
C X
C X
A Y
B Z
B X
B Z
A Y
A Z
C Y
A Y
B Y
A Z
C X
A Z
A Z
A Z
A Z
B Z
C X
C Y
A Z
C Y
C Y
A X
C X
A Z
A Z
A Z
C X
C X
C X
A Y
C Z
C Z
A Z
C X
A Y
A Z
A Z
A Z
C X
A Z
A X
A Z
A Z
A Z
A Z
A Y
C Y
C X
A X
A Y
C X
A X
A Z
A Z
C X
A Z
A X
A Z
A Z
A X
A Z
A Z
A X
A Z
A X
B Y
A Y
A Y
C Y
A Z
A Y
C X
A Z
A Y
A X
C Y
B X
C Y
A Z
C X
A Y
A Z
A Y
A X
C Y
A Z
A Z
C Y
C X
A Z
C X
A Y
C X
A Z
A Y
A Z
A Z
A Z
A Y
A Z
C X
C X
A X
C X
C X
A Z
C X
A Z
C Y
C X
A Z
A Z
A Z
C X
A X
C Y
A Z
C Y
A X
A Z
C X
A Z
A Z
A X
A Z
C X
B X
A Z
A Z
A Z
C X
A Y
A Y
A X
C Y
C Y
A Z
A Y
A Z
A Z
C X
A X
A Y
A Z
A Z
A Z
A Z
B Z
C X
C X
C X
A Z
C Z
A X
C X
A Z
C Y
A Z
A Z
A Y
A Y
C X
A Z
A X
A Z
A Z
A Z
A Z
C Y
A Z
A Y
A X
A X
A Z
C X
A X
A X
A Z
A Y
C X
A Z
A Z
A Y
A Z
B Z
C X
C X
C Z
C Y
C X
A Z
C Y
A Z
C Z
A Z
A Y
A Y
A X
A X
A Z
A Y
A Y
A Y
A Y
A Z
C Y
A Z
A Z
C X
A Z
A Z
C Y
A Y
C X
A Y
C X
A Z
B Z
A X
B X
A Y
A X
A Y
B Z
A Y
A Z
C Y
C Y
A Z
A X
A Z
A Z
C Z
A Z
A Y
C X
A Y
C X
A X
A Y
C Y
A Y
A Z
A Z
C X
C X
B Z
A Z
A Z
A X
C X
C Y
A Z
A Z
A X
C X
C Z
A Z
C Y
A Y
B Z
C Y
A Z
C X
A X
A Z
A Z
A Z
A Y
C Y
A Z
C Y
A Z
A Z
A Z
A Z
A Y
C X
A Y
C Y
B Z
A Z
C X
C Y
A Z
C X
A Z
C X
C Z
A Z
C X
C X
A Z
A Z
A Y
A Y
A Y
C X
A Y
A Z
A Z
A Z
A Z
A Z
A Z
A Y
A Z
A X
C Y
A Z
A Z
A Z
A Y
A Z
A Z
A Z
A Z
C X
B Z
A Z
A Y
A Y
A X
A Z
A Z
C Z
A Z
C X
A Y
A X
B Z
A Z
A Z
A Z
C Y
C Z
C X
A Z
C Y
C Y
C Y
C X
B Z
A Z
A Z
C Z
A X
A Z
A Z
A Z
C X
A Z
A Z
C Y
C Y
A Z
A Z
C X
A Y
C Y
C Y
A Z
A Z
A X
A Z
A Z
A X
A X
C X
A Z
A X
C X
C X
A Z
A X
A Z
C X
C X
C X
C Y
A Z
A Z
A X
A Z
A Y
A Z
A Z
C Y
A Z
A Z
A Z
A X
A Z
C X
A X
A Z
A Z
A Z
A Z
A Z
A Z
A Z
A Y
A X
A Y
A X
C Y
A Z
A Z
C X
A Z
A Z
A Z
A X
A Z
A Z
A Y
C X
A Y
A Z
C X
A X
A Y
A Z
A Z
A X
A Z
A Y
C X
A Y
A Z
A Z
A Z
A Z
C X
C Y
A Z
B Z
C X
A Z
A Z
C Y
C Y
C X
A X
C Y
B Y
A Z
A Z
A Z
C Y
A Z
A X
A Y
A Z
A Z
A Z
C Y
A Z
C Y
C X
A Z
A Z
A Z
A Z
A Z
A X
A Z
A Z
C X
A Z
A Y
C Z
A Z
A Z
A Z
B X
C X
A Z
A Z
A Z
A Z
C X
A Z
A Z
A Y
A X
C X
C Y
A X
A Y
C X
A Z
A Z
C X
C X
A Z
C X
A Z
A Y
C X
A Z
B X
B Y
A X
C Y
A X
A Y
C Y
A Z
A Z
A Z
C X
A Z
A X
A Z
C Y
A Z
A Z
C X
A Z
A Z
A Y
A Z
A X
A Y
A Z
C X
C Y
B X
C Y
A Y
A Z
C X
A Z
C X
C Y
A X
A X
A Z
A Z
C Y
A Y
A Y
A Z
A Z
C X
A X
C X
A X
A Y
C X
A Z
A Z
B Y
A Z
A Z
A Z
A Z
A Z
A X
A Y
A X
A Z
A Z
C X
A Y
A Z
C Y
C X
C X
C X
C X
C Y
A X
A X
C Y
A X
A Y
A Y
B Z
A Z
B Y
C Y
A X
A Y
A Z
A Z
A Z
A X
C X
A Z
A Z
A Z
A Z
A Z
A Y
A Z
B Z
A Z
A Z
A Y
C Y
C Y
C X
A Z
A X
C X
A Y
B Z
C X
A Z
C X
C Y
C Y
A X
A X
C X
A Z
A Z
A Y
A X
A X
A Z
C Y
B X
A Z
A Z
A Z
A Z
A Y
A Y
A Z
C Y
C Y
A X
A Z
A Z
C Y
A Y
A Y
A X
A Y
A X
A X
A X
A Z
A Z
A Y
A Z
C X
A Z
A Y
A Z
A Z
A Y
A Z
A Z
C X
A Z
A Y
A Z
A Z
A Z
A Z
A Z
A Z
A Y
C X
B Z
C Z
A Z
A Y
A X
A X
C Y
C Y
A X
C X
B Z
A Z
C X
A Z
A Z
A Z
A Z
A Z
A Z
A Z
A Y
A Z
A Z
A Y
A Z
A Y
A Y
A Z
A Z
A Y
A Z
C Y
A Z
A Z
A Z
C X
C X
A Z
C Y
A Z
A Z
C X
A Z
C X
A Y
A Z
C Y
A Z
A Z
C X
C Y
A Z
C X
C X
A X
A Y
C Y
A Y
A Z
C X
A Z
A Z
A X
A Z
C Y
A Z
C X
A Z
C X
A Z
C X
A Y
C Y
A X
A Z
A Z
C Y
A X
A Z
A Y
B Z
A Z
A X
A Z
A Z
A X
C X
A Z
A Z
C Y
A Z
A Y
A Z
C Y
A Z
A Y
A Z
C Z
A Y
A Z
A Y
C Y
A Z
C X
A X
B Z
C X
C X
A Z
A Z
A Y
A X
A Z
A Z
B Z
A Z
C Z
A X
A Z
A Z
A Z
A Z
A X
A X
A Z
A X
A Z
A Z
A Z
A X
C X
C Y
A X
C X
C X
A Z
A X
C Y
B Z
A Z
A Z
C X
B X
A Z
A Z
C X
C X
B Z
C Y
A Z
A Z
C X
A X
A Y
C Y
C Y
B Z
A Y
C X
A Z
A Z
A Y
C X
A Z
A Z
C X
C Y
A Z
C X
C Y
C Y
C X
C Y
A Z
C Y
A Z
C X
A Z
C Y
C Z
A Z
B Z
A Z
C X
C X
B Y
B Z
C Y
C X
C X
A Y
C X
C X
A Z
A Y
A Z
C X
A X
A Z
A Z
A Z
A Z
A Z
A Z
A Z
C X
C X
A Z
C Y
C X
A Z
B Z
A Z
A Z
A X
C X
A Y
A Z
A Z
A Y
A X
C Y
B X
A Z
A X
C Y
C X
C X
C Y
C Y
A Z
A Z
C Y
A Z
A Y
C Y
A Y
C X
A Z
C X
C Y
C Y
A Z
A Z
A X
A Y
A Z
A X
A Z
A Z
A Z
C Y
A Z
A Z
C X
C Y
A Z
A Z
A Z
C Y
C X
A Z
C X
A Z
A Z
A Z
A X
A Z
A Z
A Y
B Z
A Z
A Z
A Z
C Y
A Z
B Z
A Z
C Z
A Z
A Y
C X
C Y
C X
C X
A Z
A Z
A Y
A Y
A Z
A Y
B Z
C Y
A Y
A Z
C X
A Z
A Z
C Y
A Y
A Z
A Y
C Y
A Z
A Z
A X
B Z
A Z
A X
C X
A Z
C Y
C Y
A Z
B Y
A Y
A Z
A Z
A Z
A Z
C X
C X
A Z
C X
A Y
A Z
A Z
C Y
A Z
A Z
C Y
C X
B Z
A Y
A Y
C X
C X
A Z
A X
B Z
A Z
C Y
A Z
A Y
A Z
A Z
A Y
C Y
C X
A Z
C X
A Z
C Y
A Z
C Y
A Y
A Z
A Y
A Z
C X
A Z
A Z
C X
A Z
B Y
A Z
A Z
C Y
C X
C X
A Z
A Z
C X
B Z
A Y
A Z
A Y
A Z
A Z
A Y
A X
C X
C X
A X
A Z
A Y
A Y
A Z
A Y
A Z
A Z
C Y
A X
A Z
A Z
C X
A Z
A X
B X
C X
A Z
A Y
B Z
C X
C Y
A Z
B Z
C Y
A Z
A Z
A X
A Z
A Z
A Z
A Z
A Z
A Z
A Z
"""
}


/*
 --- Day 2: Rock Paper Scissors ---
 The Elves begin to set up camp on the beach. To decide whose tent gets to be closest to the snack storage, a giant Rock Paper Scissors tournament is already in progress.

 Rock Paper Scissors is a game between two players. Each game contains many rounds; in each round, the players each simultaneously choose one of Rock, Paper, or Scissors using a hand shape. Then, a winner for that round is selected: Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock. If both players choose the same shape, the round instead ends in a draw.

 Appreciative of your help yesterday, one Elf gives you an encrypted strategy guide (your puzzle input) that they say will be sure to help you win. "The first column is what your opponent is going to play: A for Rock, B for Paper, and C for Scissors. The second column--" Suddenly, the Elf is called away to help with someone's tent.

 The second column, you reason, must be what you should play in response: X for Rock, Y for Paper, and Z for Scissors. Winning every time would be suspicious, so the responses must have been carefully chosen.

 The winner of the whole tournament is the player with the highest score. Your total score is the sum of your scores for each round. The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).

 Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.

 For example, suppose you were given the following strategy guide:

 A Y
 B X
 C Z
 This strategy guide predicts and recommends the following:

 In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
 In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
 The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
 In this example, if you were to follow the strategy guide, you would get a total score of 15 (8 + 1 + 6).

 What would your total score be if everything goes exactly according to your strategy guide?
 */
