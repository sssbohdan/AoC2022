//
//  AlgebraicDataTypes3.swift
//  Algorithms
//
//  Created by Bohdan Savych on 18/11/2022.
//

import Foundation

//enum Either<A, B> {
//  case left(A)
//  case right(B)
//}
//
//struct Pair<A, B> {
//  let first: A
//  let second: B
//}
//
//struct Func<A, B> {
//  let apply: (A) -> B
//}


// Either<A, B> = A + B
// Pair<A, B>   = A * B
// Func<A, B>   = B^A

// Either<Pair<A, B>, Pair<A, C>>
//   = Pair<A, B> + Pair<A, C>
//   = A * B + A * C
//   = A * (B + C)
//   = Pair<A, B + C>
//   = Pair<A, Either<B, C>>


// | Algebra      | Swift Type System |
// | ------------ | ----------------- |
// | Sums         | Enums             |
// | Products     | Structs           |
// | Exponentials | Functions         |
// | Functions    | Generics          |

