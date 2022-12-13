//
//  Queue.swift
//  Algorithms
//
//  Created by Bohdan Savych on 12/12/2022.
//

import Foundation

struct Queue<Element>  {
    private var left: [Element] = []
    private var right: [Element] = []

    init(arr: [Element]) {
        self.right = arr
    }
    /// Add an element to the back of the queue.
    /// - Complexity: O(1).
    mutating func enqueue(_ newElement: Element) {
        right.append(newElement)
    }

    mutating func enqueue(_ arr: [Element]) {
        right.append(contentsOf: arr)
    }
    /// Removes front of the queue.
    /// Returns `nil` in case of an empty queue.
    /// - Complexity: Amortized O(1).
    mutating func dequeue() -> Element? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}
