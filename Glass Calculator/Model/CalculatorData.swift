//
//  CalculatorData.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/18/24.
//

import Foundation
//내부 데이터의 변경이 계속 이루어지는 부분과 클로저 딕셔너리 사용 등을 고려하여 클래스로 선언함
final class CalculatorData {
    struct CaculatorProperty {
        var displayNumber: String = "0"
        var firstOperand: String?
        var operatorSymbol: String?
        var isSecondOperandFirstNum: Bool = true
    }
    
    private(set) var statusData: CaculatorProperty = CaculatorProperty()
    
    func calculate(title: String?) {
        guard let title = title,
              let button = Buttons.getButtonCase(title: title),
              let calculateAction = getCalculateDictionary(text: title)[button] else { return }
        calculateAction()
    }
}

extension CalculatorData {
    private func getCalculateDictionary(text: String) -> [Buttons : () -> Void] {
        return [
            .number(.one): {[weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.two): {[weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.three): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.four): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.five): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.six): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.seven): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.eight): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.nine): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.zero): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(num: text)
            },
            .number(.dot): { [weak self] in
                guard let self = self else { return }
                self.dotTapped()
            },
            .symbol(.plus): { [weak self] in
                guard let self = self else { return }
                self.operatorTapped(symbol: text)
            },
            .symbol(.minus): { [weak self] in
                guard let self = self else { return }
                self.operatorTapped(symbol: text)
            },
            .symbol(.multiply): { [weak self] in
                guard let self = self else { return }
                self.operatorTapped(symbol: text)
            },
            .symbol(.divide): { [weak self] in
                guard let self = self else { return }
                self.operatorTapped(symbol: text)
            },
            .symbol(.equal): { [weak self] in
                guard let self = self else { return }
                self.calculate()
            },
            .symbol(.percent): { [weak self] in
                guard let self = self else { return }
                self.percentTapped()
            },
            .symbol(.negate): { [weak self] in
                guard let self = self else { return }
                self.negateTapped()
            },
            .symbol(.clear): { [weak self] in
                guard let self = self else { return }
                self.clearTapped()
            },
            .symbol(.allClear): { [weak self] in
                guard let self = self else { return }
                
            }
        ]
    }
}

extension CalculatorData {
    private func numberTapped(num: String) {
        /*
         1. displayNumber에 이어붙인다.
         2. displayNumber가 0이면 바로 해당 text로 교체
         3. 0이 아니면 +로 이어붙이기
         4. 연산자가 눌린 상태일 때는 다시 2번처럼 text로 교체
         5. 근데 눌린 상태더라도 첫 숫자만 2번처럼 교체하고 이후로는 3번처럼 +로 붙인다.
         */
        if self.statusData.operatorSymbol != nil {
            if self.statusData.isSecondOperandFirstNum == true {
                self.statusData.displayNumber = num
                self.statusData.isSecondOperandFirstNum = false
            } else {
                if self.statusData.displayNumber.count < 8 {
                    self.statusData.displayNumber += num
                }
            }
        } else if self.statusData.displayNumber == "0" {
            self.statusData.displayNumber = num
        } else {
            if self.statusData.displayNumber.count < 8 {
                self.statusData.displayNumber += num
            }
        }
    }
    
    private func dotTapped() {
        /*
         .은 기존에 .이 없다면 .붙이는 것으로 끝
         */
        if self.statusData.displayNumber.contains(".") { return }
        self.statusData.displayNumber += "."
    }
    
    private func percentTapped() {
        //0.01을 계속 곱하기. 0인 경우엔 0
        if let num = Double(self.statusData.displayNumber) {
            if num != 0 {
                self.statusData.displayNumber = String(num * 0.01)
            }
        }
    }
    
    private func negateTapped() {
        if let num = Double(self.statusData.displayNumber) {
            self.statusData.displayNumber = self.formatNum(num: num * -1)
        }
    }
    
    private func clearTapped() {
        self.statusData.displayNumber = "0"
        self.statusData.firstOperand = nil
        self.statusData.isSecondOperandFirstNum = true
    }
    
    private func operatorTapped(symbol: String) {
        /*
         1. operatorIsSelected가 false면 true로 바꾸고 operatorSymbol바꿈, firstOperand에 displayNum넣음
         2. isSelected가 true면 symbol을 비교하여 동일할 경우 selected를 false로 바꾸고 symbol을 nil로
         3. isSelected가 true고 symbol이 다른 경우 selected는 유지하고 symbol만 교체함
         4. isSelected가 true고 firstOperand가 있는데 displayNum이 있다면 연산 후 firstOperand와 display에 넣음
         5. operatorSymbol의 값으로 isSelected를 대체할 수 이
         */
        if self.statusData.firstOperand != nil {
            calculate()
        }
        if self.statusData.operatorSymbol == symbol {
            self.statusData.operatorSymbol = nil
        } else {
            self.statusData.operatorSymbol = symbol
            self.statusData.firstOperand = self.statusData.displayNumber
        }
    }
    
    private func calculate() {
        /*
         1. firstOperand가 비어있으면 return
         2. 차있으면 계산
         3. 계산 후 first와 display에 삽입
         4. secondFirstnum을 true로 변경
         */
        guard let firstOperand = Double(self.statusData.firstOperand ?? "error"),//에러처리 해야 함
              let secondOperand = Double(self.statusData.displayNumber),
              let selectedOperator = self.statusData.operatorSymbol else { return }
        
        switch selectedOperator {
        case "+":
            let result = self.formatNum(num: firstOperand + secondOperand)
            self.statusData.displayNumber = result
            self.statusData.firstOperand = result
            self.statusData.isSecondOperandFirstNum = true
        case "-":
            let result = self.formatNum(num: firstOperand - secondOperand)
            self.statusData.displayNumber = result
            self.statusData.firstOperand = result
            self.statusData.isSecondOperandFirstNum = true
        case "×":
            let result = self.formatNum(num: firstOperand * secondOperand)
            self.statusData.displayNumber = result
            self.statusData.firstOperand = result
            self.statusData.isSecondOperandFirstNum = true
        case "÷":
            let result = self.formatNum(num: firstOperand / secondOperand)
            self.statusData.displayNumber = result
            self.statusData.firstOperand = result
            self.statusData.isSecondOperandFirstNum = true
        default:
            return
        }
        self.statusData.operatorSymbol = nil
    }
}

extension CalculatorData {
    private func formatNum(num: Double) -> String {
        let formattedNum = (num == floor(num) ? String(Int(num)) : String(num))
        let croppedNum: String
        if formattedNum.contains(".") {
            croppedNum = String(formattedNum.prefix(10))
        } else {
            croppedNum = String(formattedNum.prefix(9))
        }
        
        return croppedNum
    }
}

