//
//  DiceCalculatorRow.swift
//  DiceCalc
//
//  Created by Michael Craun on 7/31/21.
//

import SwiftUI

@available(macOS 11.0, *)
@available(iOS 13.0, *)
struct DiceCalculatorRow: View {
    
    @ObservedObject var viewModel: DiceCalculatorViewModel
    let actions: [DieButtonAction]
    
    @State private var columns: [GridItem] = []
    
    var body: some View {
    
        LazyVGrid(columns: columns) {
            
            ForEach(actions, id: \.title) { action in
                
                Button(action: { viewModel.buttonPressed(action: action) }, label: {
                    
                    if let symbol = action.symbol {
                        
                        Image(systemName: symbol)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    } else {
                    
                        Text(action.title)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    }
                    
                })
                
            }
            
        }
        .frame(height: 50)
        .onAppear { columns = actions.map { _ in GridItem(.flexible()) } }
    
    }
    
}

@available(macOS 11.0, *)
struct DiceCalculatorRow_Previews: PreviewProvider {
    static var previews: some View {
        DiceCalculatorRow(viewModel: DiceCalculatorViewModel(), actions: [.d4, .d6, .d8, .delete])
            .buttonStyle(DiceCalculatorButtonStyle(configuration: ButtonConfiguration(background: Color.gray)))
    }
}
