//
//  DiceCalculatorViewModel.swift
//  DiceCalc
//
//  Created by Michael Craun on 7/31/21.
//

import Foundation

@available(macOS 10.15, *)
@available(iOS 14.0, *)
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
        
        // This is the first entry and the entry is 0
        if actions.isEmpty && number.output == "0" {
            return
        }
        
        // The last button pressed was a die
        if case .die(_) = actions.last {
            // Adding 0 is useless so don't allow the user to do it
            if number.output == "0" {
                return
            }
            
            // Append the add operation
            actions.append(.add)
        }
        
        // The last button pressed was a number; should check if the current number is more than 5 digits
        // and not allow the user to enter that digit if it is
        if case .number(_) = actions.last {
            let newNumber = Int("\(formula.split(separator: " ").last!)\(number.output)")!
            if newNumber > 99999 {
                return
            }
        }
        
        // Adding 0 is useless so don't allow the user to do it
        if case .operation(_) = actions.last, number.output == "0" {
            return
        }
        
        // Finally add the number to the formula
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
        
        // If the last button pressed was an operation, it's useless, so remove it
        if case .operation(_) = actions.last {
            actions.removeLast()
        }
        
        // Split the formula into individual components and roll any dice present
        var components = formula.split(separator: " ")
        for (index, component) in components.enumerated() {
            if let die = Die(description: String(component)) {
                components[index] = "\(die.roll())"
            }
        }
        
        // Rejoin components
        let simplifiedExpression = components
            .joined(separator: " ")
            .replacingOccurrences(of: DieButtonAction.add.output, with: "+")
            .replacingOccurrences(of: DieButtonAction.divide.output, with: "/")
            .replacingOccurrences(of: DieButtonAction.multiply.output, with: "*")
            .replacingOccurrences(of: DieButtonAction.subtract.output, with: "-")
        
        // Evaluate simplified expression and assign output
        let expression = NSExpression(format: simplifiedExpression)
        let result = expression.expressionValue(with: nil, context: nil)
        output = "\(result!)"
        
    }
    
    func buttonPressed(action: DieButtonAction) {
        
        if action == .delete {
            deleteLast()
        } else if case .roll(_,_) = action {
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
