//
//  DiceCalculatorConfiguration.swift
//  DiceCalc
//
//  Created by Michael Craun on 8/1/21.
//

import SwiftUI

class DiceCalculatorConfiguration {
    
    var buttonConfiguration = ButtonConfiguration(style: DiceCalculatorButtonStyle())
    var formulaFont: Font = .title2
    var outputFont: Font = .title
    var textConfiguration = TextConfiguration(background: Color.gray)
    
}

extension DiceCalculatorConfiguration {
    
    class ButtonConfiguration<Style:ButtonStyle> {
        
        var style: Style
        
        init(style: Style) {
            self.style = style
        }
        
    }
    
    class TextConfiguration<Background:View> {
        
        var background: Background
        var cornerRadius: CGFloat
        var shadowRadius: CGFloat
        
        init(background: Background, cornerRadius: CGFloat = 5, shadowRadius: CGFloat = 10) {
            self.background = background
            self.cornerRadius = cornerRadius
            self.shadowRadius = shadowRadius
        }
        
    }
    
}
