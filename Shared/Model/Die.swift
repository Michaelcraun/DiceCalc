//
//  Die.swift
//  DiceCalc
//
//  Created by Michael Craun on 8/1/21.
//

import Foundation

enum Die {
    case d4(Int)
    case d6(Int)
    case d8(Int)
    case d10(Int)
    case d12(Int)
    case d20(Int)
    
    var average: Double {
        switch self {
        case .d4:   return 2.5
        case .d6:   return 3.5
        case .d8:   return 4.5
        case .d10:  return 5.5
        case .d12:  return 6.5
        case .d20:  return 10.5
        }
    }
    
    var numOfDice: Int {
        switch self {
        case .d10(let num),
             .d12(let num),
             .d20(let num),
             .d4(let num),
             .d6(let num),
             .d8(let num):
            return num
        }
    }
    
    var range: ClosedRange<Int> {
        switch self {
        case .d4:   return 1...4
        case .d6:   return 1...6
        case .d8:   return 1...8
        case .d10:  return 1...10
        case .d12:  return 1...12
        case .d20:  return 1...20
        }
    }
    
    init?(description: String) {
        
        let components = description.components(separatedBy: "d")
        if components.count == 2 {
            guard let numOfDice = Int(components[0]),
                let die = Int(components[1]) else { return nil }
            switch die {
            case 4: self = .d4(numOfDice)
            case 6: self = .d6(numOfDice)
            case 8: self = .d8(numOfDice)
            case 10: self = .d10(numOfDice)
            case 12: self = .d12(numOfDice)
            case 20: self = .d20(numOfDice)
            default: return nil
            }
        } else {
            return nil
        }
        
    }
    
    func roll() -> Int {
        
        var total: Int = 0
        
        for _ in 1...numOfDice {
            total += range.randomElement()!
        }
        
        return total
        
    }
    
}
