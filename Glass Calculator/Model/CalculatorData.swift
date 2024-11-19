//
//  CalculatorData.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/18/24.
//

struct CalculatorData {
    private(set) var firstOperand: Double? // 연산된 후 바로 firstOperand의 값을 수정하여 사용하기 때문에 result가 없음.
    private(set) var secondOperand: Double?
    private(set) var operatorSymbol: String?
    
    mutating func getOperand(in position: OperandPosition, to value: Double) {
    var hello = 0
        
    var asd = hello + 2
        
        
        if position == .first {
            self.firstOperand = value
        } else {
            self.secondOperand = value
        }
    }
    
    mutating func getOperator(to symbol: OperatorSymbol) {
        self.operatorSymbol = symbol.rawValue
    }
}

extension CalculatorData {
    enum OperandPosition {
        case first
        case second
    }
    
    enum OperatorSymbol: String {
        case plus = "+"
        case minus = "-"
        case multiply = "×"
        case divide = "÷"
        case equal = "="
        case percent = "%"
        case negate = "±"
        case clear = "C"
        case allClear = "AC"
    }
}
