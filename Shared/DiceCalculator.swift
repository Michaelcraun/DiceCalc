//
//  ContentView.swift
//  Shared
//
//  Created by Michael Craun on 7/31/21.
//

import SwiftUI

struct ContentView<TextBackground: View>: View {
    
    @StateObject var viewModel = DiceCalculatorViewModel()
    let textBackground: TextBackground
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.flexible())]) {
            
            VStack {
                
                Text(viewModel.output)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(viewModel.formula)
                    .font(.title2)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .foregroundColor(.black)
            .padding()
            .background(textBackground)
            .cornerRadius(5)
            .shadow(radius: 10)
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.d4, .d6, .d8, .delete])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.d10, .d12, .d20, .divide])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.seven, .eight, .nine, .multiply])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.four, .five, .six, .subtract])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.one, .two, .three, .add])
            
            DiceCalculatorRow(viewModel: viewModel, actions: [.zero, .roll])
            
        }
        .padding()
        .buttonStyle(DiceCalculatorButtonStyle())
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: DiceCalculatorViewModel(), textBackground: Color.gray)
    }
}
