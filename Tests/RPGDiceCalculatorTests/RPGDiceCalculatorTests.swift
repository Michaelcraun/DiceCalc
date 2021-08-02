    import XCTest
    @testable import RPGDiceCalculator

    final class RPGDiceCalculatorTests: XCTestCase {
        
        func testRollCompletion() {
            
            // Update this value to test apporpriately
            // NOTE: This value can be as complex as you would like it to be, but must be in the "xdy + z" format
            // where x is the number of dice, y is the type of die and z is the modifier.
            // For example, "2d6+2" will cause a crash, but "2d6 + 2d12 + 13 / 13d10" will not.
            let formula = "2d6 + 2"
            let model = DiceCalculatorViewModel()
                .onRoll { roll in
                    print("###### roll for \(formula) was \(roll) ######")
                }
            model.formula = formula
            model.roll()
            
        }
        
        func testFormulaUpdate() {
            
            // Update the values of this to test appropriately
            // NOTE: This test simulates button presses by the user, so if it would normally be an invalid input,
            // nothing will print where the input is invalid!
            let buttonPresses: [DieButtonAction] = [.two, .d6, .two]
            let model = DiceCalculatorViewModel()
                .onChange { formula in
                    print("###### formula was changed to \(formula) ######")
                }
            buttonPresses.forEach {
                model.buttonPressed(action: $0)
            }
            
        }
        
    }
