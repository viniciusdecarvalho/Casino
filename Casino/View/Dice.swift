//
//  Dice.swift
//  Casino
//
//  Created by Vinicius Carvalho on 11/04/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import Foundation

struct Dice: Hashable {
    
    static let one = Dice(1, map: Dictionary(dictionaryLiteral: (5, 1.0)))
    static let two = Dice(2, map: Dictionary(dictionaryLiteral: (3, 1.0), (7, 1.0)))
    static let three = Dice(3, map: Dictionary(dictionaryLiteral: (3, 1.0), (5, 1.0), (7, 1.0)))
    static let four = Dice(4, map: Dictionary(dictionaryLiteral: (1, 1.0), (3, 1.0), (7, 1.0), (9, 1.0)))
    static let five = Dice(5, map: Dictionary(dictionaryLiteral: (1, 1.0), (3, 1.0), (5, 1.0), (7, 1.0), (9, 1.0)))
    static let six = Dice(6, map: Dictionary(dictionaryLiteral: (1, 1.0), (2, 1.0), (3, 1.0), (7, 1.0), (8, 1.0), (9, 1.0)))
    
    private static let all = [one, two, three, four, five, six]
    
    public static var first: Dice {
        return Dice.one
    }
    
    public static var last: Dice {
        return Dice.six
    }
    
    public static func random() -> Dice {
        let selected = Int.random(in: first.number ... last.number) - 1
        return Dice.all[selected]
    }
    
    public static func random(count: Int) -> [Dice] {
        Array(repeating: 1, count: count).map({ _ in
            Dice.random()
        })
    }
    
    static func isWinner(winnerValue: Int, _ dices: [Dice]) -> Bool {
        return dices.map({ d in d.number }).reduce(0, +) == winnerValue
    }
    
    let map: Dictionary<Int, Double>
    let number: Int
    
    private init(_ number: Int, map: Dictionary<Int, Double>) {
        self.number = number
        self.map = map
    }
    
    func valueOf(_ index: Int) -> Double? {
        return self.map[index]
    }
}
