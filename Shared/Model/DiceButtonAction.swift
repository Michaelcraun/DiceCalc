//
//  DiceButtonAction.swift
//  DiceCalc
//
//  Created by Michael Craun on 8/1/21.
//

import Foundation

enum DieButtonAction: Equatable {
    case delete
    case die(String)
    case number(String)
    case operation(String)
    case roll(String?, String)
    
    // DIe buttons
    static var d4: DieButtonAction { return .die("d4") }
    static var d6: DieButtonAction { return .die("d6") }
    static var d8: DieButtonAction { return .die("d8") }
    static var d10: DieButtonAction { return .die("d10") }
    static var d12: DieButtonAction { return .die("d12") }
    static var d20: DieButtonAction { return .die("d20") }
    
    // Number buttons
    static var zero: DieButtonAction { return .number("0") }
    static var one: DieButtonAction { return .number("1") }
    static var two: DieButtonAction { return .number("2") }
    static var three: DieButtonAction { return .number("3") }
    static var four: DieButtonAction { return .number("4") }
    static var five: DieButtonAction { return .number("5") }
    static var six: DieButtonAction { return .number("6") }
    static var seven: DieButtonAction { return .number("7") }
    static var eight: DieButtonAction { return .number("8") }
    static var nine: DieButtonAction { return .number("9") }
    
    // Operation buttons
    static var add: DieButtonAction { return .operation("􀅼")}
    static var divide: DieButtonAction { return .operation("􀅿")}
    static var multiply: DieButtonAction { return .operation("􀅾")}
    static var subtract: DieButtonAction { return .operation("􀅽")}
    
    var ascii: String? {
        switch self {
        case .add:      return "\u{002B}"
        case .divide:   return "\u{00F7}"
        case .multiply: return "\u{00D7}"
        case .subtract: return "\u{2212}"
        default:        return nil
        }
    }
    
    var symbol: String? {
        switch self {
        case .add:                  return "plus"
        case .delete:               return "xmark.rectangle.fill"
        case .divide:               return "divide"
        case .multiply:             return "multiply"
        case .roll(let symbol, _):  return symbol
        case .subtract:             return "minus"
        default:                    return nil
        }
    }
    
    var output: String {
        switch self {
        case .add:              return " \(ascii!) "
        case .delete:           return ""
        case .die(let die):     return die
        case .divide:           return " \(ascii!) "
        case .multiply:         return " \(ascii!) "
        case .number(let num):  return num
        case .roll:             return "Roll"
        case .subtract:         return " \(ascii!) "
        default:                return ""
        }
    }

    var title: String {
        switch self {
        case .delete:               return ""
        case .die(let die):         return die
        case .number(let num):      return num
        case .operation:            return ""
        case .roll(_, let title):   return title
        }
    }
}
