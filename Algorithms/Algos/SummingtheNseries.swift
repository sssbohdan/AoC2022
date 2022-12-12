//
//  SummingtheNseries.swift
//  Algorithms
//
//  Created by Bohdan Savych on 10/10/2022.
//

import Foundation

final class SummingtheNseries {
//    T(n) = n^2 - (n - 1)^2
//    S(n) = T1 + T2 + T3 + ... + Tn
//    this can be solved in O(1) since every next sum nulifies previous one, so we need to calculate only last one.
//    But it gives new problem with integer overflow, so we cannot just multiply and take module.
//    (a ⋅ b) mod m = [(a mod m) ⋅ (b mod m)] mod m

    func summingSeries(n: Int) -> Int {
        let m = (1000000000 + 7)
        return ((n % m) * (n % m)) % m
    }
}
