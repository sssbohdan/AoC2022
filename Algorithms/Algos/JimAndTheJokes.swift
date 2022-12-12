//
//  JimAndTheJokes.swift
//  Algorithms
//
//  Created by Bohdan Savych on 11/10/2022.
//

import Foundation

//"Why do programmers always mix up event x and event y ? Because f(my, dx)  = (fmx, dy)".
//"Why do programmers always mix up Christmas and Halloween? Because Dec 25 is Oct 31".

//10 25 -> 8 31
//25 in 10 system is 31 in 8 system
//8 31
//(m, d), m <= 12, d <= 31
final class JimAndTheJokes {
    func solve(dates: [[Int]]) -> Int {
        0
    }

    func findAllCombinations(month: Int, day: Int) {
        let decimal = convertFromAnyToDecimal(number: day, system: month)

        for m in 2...12 {
            if m == month { continue }
            let d = convertDecimal(number: decimal, toSystem: m)
            print("month \(m) day \(d)")
        }
    }

    func convertDecimal(number: Int, toSystem systemB: Int) -> Int {
        var number = number
        var acc = ""
        while number != 0 {
            let quotient = number / systemB
            let reminder = number % systemB
            acc = "\(reminder)" + acc
            number = quotient
        }

        return Int(acc)!
    }

    func convertFromAnyToDecimal(number: Int, system: Int) -> Int {
        var acc = 0
        let arr = Array("\(number)")
        for (index, digit) in arr.enumerated() {
            acc += Int(String(digit))! * (pow(Decimal(system), arr.count - index - 1) as NSDecimalNumber).intValue
        }

        return acc
    }
}
