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
        var operatorSymbol: String = ""
        var opratorIsSelected: Bool = false
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
                self.numberTapped(text: text)
            },
            .number(.two): {[weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.three): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.four): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.five): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.six): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.seven): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.eight): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.nine): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.zero): { [weak self] in
                guard let self = self else { return }
                self.numberTapped(text: text)
            },
            .number(.dot): { [weak self] in
                guard let self = self else { return }
                self.dotTapped()
            },
            .symbol(.plus): { [weak self] in
                guard let self = self else { return }
                
            },
            .symbol(.minus): { [weak self] in
                guard let self = self else { return }
                
            },
            .symbol(.multiply): { [weak self] in
                guard let self = self else { return }
                
            },
            .symbol(.divide): { [weak self] in
                guard let self = self else { return }
                
            },
            .symbol(.equal): { [weak self] in
                guard let self = self else { return }
                
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
        if self.statusData.opratorIsSelected == true {
            if self.statusData.isSecondOperandFirstNum == true {
                self.statusData.displayNumber = num
            } else {
                self.statusData.displayNumber += num
            }
        } else if self.statusData.displayNumber == "0" {
            self.statusData.displayNumber = num
        } else {
            self.statusData.displayNumber += num
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
            let formattedNum = (num == floor(num) ? String(Int(num) * -1) : String(num * -1))
            self.statusData.displayNumber = formattedNum
        }
    }
    
    private func clearTapped() {
        self.statusData.displayNumber = "0"
    }
    
    private func operatorTapped(symbol: String) {
        
    }
}

