//
//  DiceCalculatorViewModel.swift
//  DiceCalc
//
//  Created by Michael Craun on 7/31/21.
//

import Foundation

class DiceCalculatorViewModel: ObservableObject {
    
    @Published var formula: String = "0"
    @Published var output: String = "0"
    var actions: [DieButtonAction] = [] {
        didSet {
            formula = actions.map({ $0.output }).joined(separator: "")
        }
    }
    
    private func add(die: DieButtonAction) {
        
        // This is the first button the user has pressed; should be represented as 1dx
        if actions.isEmpty {
            actions.append(.one)
        }
        
        // The last entry was a die
        if case .die(let currentDie) = actions.last {
            // Of the same type; increase dice amount
            if currentDie == die.title {
                guard let index = actions.lastIndex(of: .die(currentDie)) else { fatalError() }
                if case .number(let number) = actions[index - 1], let num = Int(number) {
                    actions[index - 1] = .number("\(num + 1)")
                    return
                }
            // Of a different type; append add operation and num of dice default (1) before appending die
            } else {
                actions.append(.add)
                actions.append(.one)
            }
        }
        
        // The last entry was an operation; should append num of dice default (1) before appending die
        if case .operation(_) = actions.last {
            actions.append(.one)
        }
        
        // Finally append die
        actions.append(die)
        
    }
    
    private func add(number: DieButtonAction) {
        
        // The last button pressed was a die; should add the add operation before adding the number by default
        if case .die(_) = actions.last {
            actions.append(.add)
            actions.append(number)
            return
        }
        
        // TODO: Add case to limit number of dice that can be rolled to 5 digits long (performance issues)
        
        // No more special cases
        actions.append(number)
        
    }
    
    private func add(operation: DieButtonAction) {
        
        // No reason to divide 0 with this application
        if actions.isEmpty {
            return
        }
        
        // The last button pressed was an operation (aka, error); should replace with new operation
        if case .operation(_) = actions.last {
            actions[actions.count - 1] = operation
            return
        }
        
        // No more special cases
        actions.append(operation)
        
    }
    
    private func deleteLast() {
        
        // Only delete if there are actions
        if actions != [] {
            actions.removeLast()
            
            // If no actions present, set output to "0" to retain label size
            if actions == [] {
                formula = "0"
            }
        }
        
    }
    
    private func roll() {
        
        var components = formula.split(separator: " ")
        for (index, component) in components.enumerated() {
            if let die = Die(description: String(component)) {
                components[index] = "\(die.roll())"
            }
        }
        
        let simplifiedExpression = components
            .joined(separator: " ")
            .replacingOccurrences(of: DieButtonAction.divide.output, with: "/")
            .replacingOccurrences(of: DieButtonAction.multiply.output, with: "*")
        
        let expression = NSExpression(format: simplifiedExpression)
        let result = expression.expressionValue(with: nil, context: nil)
        
        output = "\(result!)"
        
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
