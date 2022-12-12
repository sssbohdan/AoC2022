//
//  AlgebraicDataTypes2.swift
//  Algorithms
//
//  Created by Bohdan Savych on 17/11/2022.
//

import Foundation

//1 -------------------------------------------
// Prove the equivalence of 1^a = 1 as types. This requires re-expressing this algebraic equation as types,
// and then defining functions between the types that are inverses of each other.
//
// Void
// (A -> Void)

//
//func to<A>(f: @escaping (A) -> Void) -> (() -> Void) {
//    return {
//
//    }
//}
//
//func to<A>(f: @escaping () -> Void) -> ((A) -> Void) {
//    return { a in
//        return ()
//    }
//}

//2 -------------------------------------------
//What is 0^a? Prove an equivalence. You will need to consider a = 0 and a != 0 separately.
// Never
// A -> Never // a != 0
// Never -> Never // a == 0 == NaN

//func to<A>(f: @escaping (A) -> Never) -> Never {
//     ??
// return f(1)
//}
//
//func from<A>(never: Never) -> ((A) -> Never) {
//    return { _ in
//        never
//    }
//}
//3 -------------------------------------------
//How do you think generics fit into algebraic data types? We’ve seen a bit of this with thinking of Optional<A> as A + 1 = A + Void.
//I think generic is an infinity ??

//4
//Show that sets with values in A can be represented as 2^A.
//Note that A does not require any Hashable constraints like the Swift standard library Set<A> requires.

enum Either<A, B> {
    case left(A)
    case right(B)

    var left: A? {
        switch self {
        case .left(let a):
            return a
        case .right:
            return nil
        }
    }

    var right: B? {
        switch self {
        case .left:
            return nil
        case .right(let b):
            return b
        }
    }
}

//7 -------------------------------------------
func to<A, B, C>(_ f: @escaping (Either<B, C>) -> A) -> ((B) -> A, (C) -> A) {
    (
        { b in
            return f(.left(b))
        },
        { c in
            return f(.right(c))
        }
    )
}

func from<A, B, C>(_ f: ((B) -> A, (C) -> A)) -> (Either<B, C>) -> A {
    return { eietherBC in
        switch eietherBC {
        case .left(let a):
            return f.0(a)
        case .right(let b):
            return f.1(b)
        }
    }
}

//7 -------------------------------------------
func to<A, B, C>(_ f: @escaping (C) -> (A, B)) -> ((C) -> A, (C) -> B) {
    (
        {
            f($0).0
        },
        {
            f($0).1
        }
    )
}
//
func from<A, B, C>(_ f: ((C) -> A, (C) -> B)) -> (C) -> (A, B) {
    {
        (f.0($0), f.1($0))
    }
}
