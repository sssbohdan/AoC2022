//
//  AlgebraicDataTypes1.swift
//  Algorithms
//
//  Created by Bohdan Savych on 17/11/2022.
//

import Foundation


//1 -------------------------------------------
//What algebraic operation does the function type (A) -> B correspond to?
//Try explicitly enumerating all the values of some small cases like (Bool) -> Bool, (Unit) -> Bool, (Bool) -> Three and (Three) -> Bool to get some intuition.


//(Bool) -> Bool 2^2
//(Bool) -> Three 2^3
//(Three) -> Bool 3^2
//1 -> True 2 -> Trie 3 -> True
//1 -> True 2 -> False 3 -> False
//1 -> True 2 -> True 3 -> False
//1 -> True 2 -> True 3 -> True
//1 -> True 2 -> False 3 -> True
//1 -> False 2 -> False 3 -> False
//1 -> False 2 -> True 3 -> False
//1 -> False 2 -> True 3 -> True
//1 -> False 2 -> False 3 -> True

//More generally, functions from A -> B correspond to the cardinality of B raised to A’s cardinality, i.e. B^A.
//2 -------------------------------------------
//Consider the following recursively defined data structure:
//indirect enum List<A> {
//  case empty
//  case cons(A, List<A>)
//}
//Translate this "type" into an algebraic equation relating List<A> to A.
//1 + (a + (1 + .....))
//List<A> = 1 + A * List<A>

//3 -------------------------------------------
// Is Optional<Either<A, B>> equivalent to Either<Optional<A>, Optional<B>>? If not, what additional values does one type have that the other doesn’t?

//Optional<Either<A, B>>  E<AB>? + a + b = 3
//Either<Optional<A>, Optional<B>> = a + nil + b + nil =4


//4 -------------------------------------------
//Either<Optional<A>, B> equivalent to Optional<Either<A, B>>?

//Either<Optional<A>, B> = nil a b
//Optional<Either<A, B>> = nil a b


//5 -------------------------------------------
//Swift allows you to pass types, like A.self, to functions that take arguments of A.Type.
//Overload the * and + infix operators with functions that take any type and build up an algebraic representation using Pair and Either.
//Explore how the precedence rules of both operators manifest themselves in the resulting types.
//
//enum TypeCovariance{
//    class A {
//        class func doSmth() {
//            print(Self.self)
//        }
//    }
//
//    class B: A {
//        override class func doSmth() {
//            print(Self.self)
//        }
//    }
//
//    static func doSmthWithAType<T: A>(type: T.Type) {
//        type.doSmth()
//    }
//
//    static func test() {
//        doSmthWithAType(type: B.self) // B printed
//    }
//}
