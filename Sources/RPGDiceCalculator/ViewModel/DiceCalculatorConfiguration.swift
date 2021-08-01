//
//  DiceCalculatorConfiguration.swift
//  DiceCalc
//
//  Created by Michael Craun on 8/1/21.
//

import SwiftUI


@available(macOS 11.0, *)
@available(iOS 14.0, *)
public struct DiceCalculatorConfiguration {
    
    var buttonConfiguration = ButtonConfiguration(background: Color.gray)
    var formulaFont: Font = .title2
    var outputFont: Font = .title
    var textConfiguration = TextConfiguration(background: Color.gray)
    var rollButtonSymbol: String?
    var rollButtonTitle: String = "Roll"
    
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public struct ButtonConfiguration<Background:View> {
    
    var background: Background
    var foregroundColor: (normal: Color, pressed: Color) = (.black, .white)
    var backgroundColor: (normal: Color, pressed: Color) = (.gray, .black)
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 10
    
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public struct TextConfiguration<Background:View> {
    
    var background: Background
    var foregroundColor: Color = .black
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 10
    
}
