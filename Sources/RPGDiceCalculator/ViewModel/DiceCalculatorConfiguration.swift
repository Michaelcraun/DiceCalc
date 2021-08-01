//
//  DiceCalculatorConfiguration.swift
//  DiceCalc
//
//  Created by Michael Craun on 8/1/21.
//

import SwiftUI


@available(macOS 11.0, *)
struct DiceCalculatorConfiguration {
    
    var buttonConfiguration = ButtonConfiguration(background: Color.gray)
    var formulaFont: Font = .title2
    var outputFont: Font = .title
    var textConfiguration = TextConfiguration(background: Color.gray)
    var rollButtonSymbol: String?
    var rollButtonTitle: String = "Roll"
    
}

@available(macOS 10.15, *)
struct ButtonConfiguration<Background:View> {
    
    var background: Background
    var foregroundColor: (normal: Color, pressed: Color) = (.black, .white)
    var backgroundColor: (normal: Color, pressed: Color) = (.gray, .black)
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 10
    
}

@available(macOS 10.15, *)
struct TextConfiguration<Background:View> {
    
    var background: Background
    var foregroundColor: Color = .black
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 10
    
}
