//
//  DiceCalculatorConfiguration.swift
//  DiceCalc
//
//  Created by Michael Craun on 8/1/21.
//

import SwiftUI

struct DiceCalculatorConfiguration {
    
    var buttonConfiguration = ButtonConfiguration(background: Color.gray)
    var formulaFont: Font = .title2
    var outputFont: Font = .title
    var textConfiguration = TextConfiguration(background: Color.gray)
    var rollButtonSymbol: String?
    var rollButtonTitle: String = "Roll"
    
}

struct ButtonConfiguration<Background:View> {
    
    var background: Background
    var foregroundColor: (normal: Color, pressed: Color) = (.black, .white)
    var backgroundColor: (normal: Color, pressed: Color) = (.gray, .black)
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 10
    
}

struct TextConfiguration<Background:View> {
    
    var background: Background
    var foregroundColor: Color = .black
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 10
    
}
