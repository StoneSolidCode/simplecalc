//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let l = args.last
        if args.count == 3 && l != "count" && l != "avg" && l != "fact" {
            if args[1] == "+" {
                return Int(Double(args[0])! + Double(args[2])!)
            } else if args[1] == "*" {
                return Int(Double(args[0])! * Double(args[2])!)
            } else if args[1] == "/" {
                return Int(Double(args[0])! / Double(args[2])!)
            } else if args[1] == "-" {
                return Int(Double(args[0])! - Double(args[2])!)
            } else if args[1] == "%" {
                return Int(Double(args[0])! - Double(args[2])! * (Double(args[0])! / Double(args[2])!))
            }
        } else if l == "count" {
            return args.count - 1
        } else if l == "avg" {
            var total = 0.0
            if args.count > 1 {
                for i in 0...(args.count - 2) {
                    total += Double(args[i])!
                }
                total = total / Double(args.count - 1)
            }
            return Int(total)
        } else if l == "fact" {
            var total = 1
            if args.count > 1 && Int(args[0]) ?? 0 > 0 {
                for i in 1...Int(args[0])! {
                    total = total * i
                }
            } else {
                total = 0
            }
            return total
        }
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

