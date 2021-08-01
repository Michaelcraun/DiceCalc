//
//  DiceCalculatorViewModel.swift
//  DiceCalc
//
//  Created by Michael Craun on 7/31/21.
//

import SwiftUI

class DiceCalculatorViewModel: ObservableObject {
    
    @Published var output: String = "0"
    var actions: [DieButtonAction] = [] {
        didSet {
            output = actions.map({ $0.output }).joined(separator: "")
        }
    }
    
    private func add(die: DieButtonAction) {
        
        // This is the first button the user has pressed; should be represented as 1dx
        if actions.isEmpty {
            actions.append(.one)
            actions.append(die)
            return
        }
        
        // The last entry was a die of the same type
        if case .die(let currentDie) = actions.last {
            if currentDie == die.title {
                guard let index = actions.lastIndex(of: .die(currentDie)) else { fatalError() }
                if case .number(let number) = actions[index - 1], let num = Int(number) {
                    actions[index - 1] = .number("\(num + 1)")
                }
            } else {
                actions.append(.add)
                actions.append(.one)
                actions.append(die)
            }
            return
        }
        
        actions.append(die)
        
    }
    
    private func add(number: DieButtonAction) {
        
        if case .die(_) = actions.last {
            actions.append(.add)
            actions.append(number)
            return
        }
        
        actions.append(number)
        
    }
    
    private func add(operation: DieButtonAction) {
        
        if actions.isEmpty {
            return
        }
        
        if case .operation(_) = actions.last {
            actions[actions.count - 1] = operation
            return
        }
        
        actions.append(operation)
        
    }
    
    private func deleteLast() {
        
        if actions != [] {
            actions.removeLast()
            
            if actions == [] {
                output = "0"
            }
        }
        
    }
    
    private func roll() {
        
    }
    
    func buttonPressed(action: DieButtonAction) {
        
        if action == .delete {
            deleteLast()
        } else if action == .roll {
            roll()
        } else {
            switch action {
            case .die:          add(die: action)
            case .number:       add(number: action)
            case .operation:    add(operation: action)
            default: break
            }
        }
        
    }
    
}

enum DieButtonAction: Equatable {
    case delete
    case die(String)
    case number(String)
    case operation(String)
    case roll
    
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
        case .add: return "\u{002B}"
        case .divide: return "\u{00F7}"
        case .multiply: return "\u{00D7}"
        case .subtract: return "\u{2212}"
        default: return nil
        }
    }
    
    var symbol: String? {
        switch self {
        case .add:      return "plus"
        case .delete:   return "xmark.rectangle.fill"
        case .divide:   return "divide"
        case .multiply: return "multiply"
        case .subtract: return "minus"
        default:        return nil
        }
    }
    
    var output: String {
        switch self {
        case .add:                  return " \(ascii!) "
        case .delete:               return ""
        case .die(let die):         return die
        case .divide:               return " \(ascii!) "
        case .multiply:             return " \(ascii!) "
        case .number(let num):      return num
        case .roll:                 return "Roll"
        case .subtract:             return " \(ascii!) "
        default: return ""
        }
    }

    var title: String {
        switch self {
        case .delete:           return ""
        case .die(let die):     return die
        case .number(let num):  return num
        case .operation:        return ""
        case .roll:             return "Roll"
        }
    }
}
