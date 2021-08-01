//
//  DiceCalculatorButtonStyle.swift
//  DiceCalc
//
//  Created by Michael Craun on 7/31/21.
//

import SwiftUI

struct DiceCalculatorButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let pressedBackgroundColor: Color
    let foregroundColor: Color
    let pressedForegroundColor: Color
    
    init(background: Color = .gray, pressedBackground: Color = .black, foreground: Color = .black, pressedForeground: Color = .white) {
        self.backgroundColor = background
        self.pressedBackgroundColor = pressedBackground
        self.foregroundColor = foreground
        self.pressedForegroundColor = pressedForeground
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                configuration.isPressed ?
                pressedBackgroundColor :
                backgroundColor)
            .cornerRadius(5)
            .foregroundColor(
                configuration.isPressed ?
                pressedForegroundColor :
                foregroundColor)
            .shadow(radius: 10)
            .scaleEffect(
                configuration.isPressed ?
                0.99 :
                1.0)
            .animation(.easeIn)
            
    }
    
}

struct DiceCalculatorButtonStyle_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Button(action: {  }, label: {
            Text("Test")
        })
        .buttonStyle(DiceCalculatorButtonStyle())
        
    }
    
}
