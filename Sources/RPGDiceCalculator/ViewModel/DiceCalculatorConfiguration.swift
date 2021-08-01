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
    
    var buttonConfiguration = ButtonConfiguration()
    var formulaFont: Font = .title2
    var outputFont: Font = .title
    var textConfiguration = TextConfiguration(background: Color.gray)
    var rollButtonSymbol: String?
    var rollButtonTitle: String = "Roll"
    
    public init(
        buttonConfiguration: ButtonConfiguration = ButtonConfiguration(),
        formulaFont: Font = .title2,
        outputFont: Font = .title,
        textConfiguration: TextConfiguration<Color> = TextConfiguration(background: Color.gray),
        rollButtonSymbol: String? = nil,
        rollButtonTitle: String = "Roll") {
        self.buttonConfiguration = buttonConfiguration
        self.formulaFont = formulaFont
        self.outputFont = outputFont
        self.textConfiguration = textConfiguration
        self.rollButtonSymbol = rollButtonSymbol
        self.rollButtonTitle = rollButtonTitle
    }
    
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public struct ButtonConfiguration {
    
    var foregroundColor: (normal: Color, pressed: Color) = (.black, .white)
    var backgroundColor: (normal: Color, pressed: Color) = (.gray, .black)
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 10
    
    public init(
        foregroundColor: (normal: Color, pressed: Color) = (.black, .white),
        backgroundColor: (normal: Color, pressed: Color) = (.gray, .black),
        cornerRadius: CGFloat = 5.0,
        shadowRadius: CGFloat = 10.0) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
    }
    
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public struct TextConfiguration<Background:View> {
    
    var background: Background
    var foregroundColor: Color = .black
    var cornerRadius: CGFloat = 5
    var shadowRadius: CGFloat = 10
    
    public init(
        background: Background,
        foregroundColor: Color = .black,
        cornerRadius: CGFloat = 5.0,
        shadowRadius: CGFloat = 10.0) {
        self.background = background
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
    }
    
}
