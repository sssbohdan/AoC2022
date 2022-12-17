//
//  Array+safe.swift
//  Algorithms
//
//  Created by Bohdan Savych on 17/12/2022.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        get {
            index >= 0 && index < self.count ? self[index] : nil
        }
    }
}
