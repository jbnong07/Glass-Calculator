//
//  CalculatorData.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/18/24.
//
import Foundation
//내부 데이터의 변경이 계속 이루어지는 부분과 클로저 딕셔너리 사용 등을 고려하여 클래스로 선언함
final class CalculatorData {
    private(set) var displayNumber: Double = 0
    private(set) var firstOperand: Double = 0
    private(set) var secondOperand: Double = 0
    private(set) var operatorSymbol: String = ""
    
    func calculate(title: String?) {
        guard let title = title,
              let button = Buttons.from(title: title),
              let calculateAction = getCalculateDictionary()[button] else { return }
        calculateAction()
    }
}

extension CalculatorData {
    private func getCalculateDictionary() -> [Buttons : () -> Void] {
        return [
            .number(.one): {[weak self] in
                guard let self = self else { return }
                
            },
            .number(.two): {[weak self] in
                guard let self = self else { return }
                
            },
            .number(.three): { [weak self] in
                guard let self = self else { return }
                
            },
            .number(.four): { [weak self] in
                guard let self = self else { return }
                
            },
            .number(.five): { [weak self] in
                guard let self = self else { return }
                
            },
            .number(.six): { [weak self] in
                guard let self = self else { return }
                
            },
            .number(.seven): { [weak self] in
                guard let self = self else { return }
                
            },
            .number(.eight): { [weak self] in
                guard let self = self else { return }
                
            },
            .number(.nine): { [weak self] in
                guard let self = self else { return }
                
            },
            .number(.zero): { [weak self] in
                guard let self = self else { return }
                
            },
            .number(.dot): { [weak self] in
                guard let self = self else { return }
                
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
                
            },
            .symbol(.negate): { [weak self] in
                guard let self = self else { return }
                
            },
            .symbol(.clear): { [weak self] in
                guard let self = self else { return }
                
            },
            .symbol(.allClear): { [weak self] in
                guard let self = self else { return }
                
            }
        ]
    }
}

