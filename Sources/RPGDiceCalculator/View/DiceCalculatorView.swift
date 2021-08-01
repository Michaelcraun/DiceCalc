//
//  ContentView.swift
//  Shared
//
//  Created by Michael Craun on 7/31/21.
//

import SwiftUI

@available(macOS 11.0, *)
@available(iOS 14.0, *)
public struct DiceCalculatorView: View {
    
    @StateObject var viewModel = DiceCalculatorViewModel()
    let configuration: DiceCalculatorConfiguration
    
    public var body: some View {
        
        LazyVGrid(columns: [GridItem(.flexible())]) {
            
            VStack {
                
                Text(viewModel.output)
                    .font(configuration.outputFont)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(viewModel.formula)
                    .font(configuration.formulaFont)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .foregroundColor(configuration.textConfiguration.foregroundColor)
            .padding()
            .background(configuration.textConfiguration.background)
            .cornerRadius(configuration.textConfiguration.cornerRadius)
            .shadow(radius: configuration.textConfiguration.shadowRadius)
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.d4, .d6, .d8, .delete])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.d10, .d12, .d20, .divide])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.seven, .eight, .nine, .multiply])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.four, .five, .six, .subtract])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.one, .two, .three, .add])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.zero, .roll(configuration.rollButtonSymbol, configuration.rollButtonTitle)])
            
        }
        .padding()
        .frame(idealWidth: 300, maxWidth: 400, idealHeight: 400, maxHeight: 500)
        .buttonStyle(DiceCalculatorButtonStyle(configuration: configuration.buttonConfiguration))
    
    }
    
}

@available(macOS 11.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiceCalculatorView(viewModel: DiceCalculatorViewModel(), configuration: DiceCalculatorConfiguration())
    }
}
