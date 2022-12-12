//
//  MonadsExperimentations.swift
//  Algorithms
//
//  Created by Bohdan Savych on 23/10/2022.
//

import Foundation

precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator •: CompositionPrecedence
func •<A, B, C>(f1: @escaping (A) -> B, f2: @escaping (B) -> C) -> (A) -> C {
    return {
        return f2(f1($0))
    }
}

precedencegroup FunctionApplicationPrecedence {
    higherThan: CompositionPrecedence
    associativity: right
}

infix operator >>>: FunctionApplicationPrecedence
func >>><A, B>(f: @escaping (A) -> B, a: A) -> B {
    return f(a)
}

//func dateFromNow(with interval: TimeInterval) -> Date {
//    return Date(timeIntervalSinceNow: interval)
//}
//
//func dateToString(_ date: Date) -> String {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .medium
//
//    return formatter.string(from: date)
//}
//
//// works perfectly
//let intervalToString = dateFromNow • dateToString

//func dateFromNow(with interval: TimeInterval) -> (Date, String) {
//    let date = Date(timeIntervalSinceNow: interval)
//    return (date, "Converted interval to date \(date)")
//}
//
//func dateToString(_ date: Date) -> (String, String) {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .medium
//    let stringDate = formatter.string(from: date)
//    return (stringDate, "Converted date to string \(stringDate)")
//}
////  doesn't work because types are not symmetrical anymore
//let intervalToString = dateFromNow • dateToString
typealias LoggedData<T> = (value: T, log: String)
func loggedUnit<T>(_ value: T) -> LoggedData<T> {
    (value, "")
}
func dateFromNow(with interval: TimeInterval) -> LoggedData<Date> {
    let date = Date(timeIntervalSinceNow: interval)
    return (date, "Converted interval to date \(date)")
}

func dateToString(_ date: Date) -> LoggedData<String> {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    let stringDate = formatter.string(from: date)
    return (stringDate, "Converted date to string \(stringDate)")
}

func bind<A, B>(_ f: @escaping (A) -> LoggedData<B>) -> (LoggedData<A>) -> LoggedData<B> {
    return { loggedDataA in
        let result = f(loggedDataA.value)
        return (result.value, loggedDataA.log + "\n" + result.log)
    }
}

let intervalToString = bind >>> dateFromNow • bind >>> dateToString
let nowString = intervalToString >>> loggedUnit >>> 0

//bind + unit == "restore function symmetricity" + "wrap data to new type" == monad
//Monad basically is pattern which allows to add side effects to a function and combine those functions, which initially haven't been meant for it. There are multiple different monads, this one is just one of them.
