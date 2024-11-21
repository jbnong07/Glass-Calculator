//
//  CalculatorData.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/18/24.
//

struct CalculatorData {
    private(set) var displayNumber: Double = 0
    private(set) var firstOperand: Double = 0
    private(set) var secondOperand: Double = 0
    private(set) var operatorSymbol: String?
    
    mutating func getOperand(in position: OperandPosition, to value: Double) {
        if position == .first {
            self.firstOperand = value
        } else {
            self.secondOperand = value
        }
    }
    

}

extension CalculatorData {
    enum OperandPosition {
        case first
        case second
    }
}
