//
//  DiceCalculatorButtonStyle.swift
//  DiceCalc
//
//  Created by Michael Craun on 7/31/21.
//

import SwiftUI

@available(macOS 10.15, *)
@available(iOS 14.0, *)
struct DiceCalculatorButtonStyle: ButtonStyle {
    
    let buttonConfiguration: ButtonConfiguration
    
    init(configuration: ButtonConfiguration) {
        self.buttonConfiguration = configuration
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                configuration.isPressed ?
                    buttonConfiguration.backgroundColor.pressed :
                    buttonConfiguration.backgroundColor.normal)
            .cornerRadius(buttonConfiguration.cornerRadius)
            .foregroundColor(
                configuration.isPressed ?
                    buttonConfiguration.foregroundColor.pressed :
                    buttonConfiguration.foregroundColor.normal)
            .shadow(radius: buttonConfiguration.shadowRadius)
            .scaleEffect(
                configuration.isPressed ?
                0.9 :
                1.0)
            .animation(.easeIn)
            
    }
    
}

@available(macOS 11.0, *)
struct DiceCalculatorButtonStyle_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Button(action: {  }, label: {
            Text("Test")
        })
        .buttonStyle(DiceCalculatorButtonStyle(configuration: ButtonConfiguration()))
        
    }
    
}
