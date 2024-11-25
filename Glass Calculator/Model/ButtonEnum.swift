//
//  ButtonEnum.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/21/24.
//
import Foundation

enum Buttons: Equatable, Hashable {
    case number(Numbers)
    case symbol(Symbols)
    
    enum Numbers: String, CaseIterable, Equatable, Hashable {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case zero = "0"
    }
    
    enum Symbols: String, Equatable, Hashable {
        case dot = "."
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
    
    private var buttonTitle: String {
        switch self {
        case .number(let number):
            return number.rawValue
        case .symbol(let symbol):
            return symbol.rawValue
        }
    }
    //매핑을 위한 딕셔너리
    private static let buttonMap: [String: Buttons] =  [
        "1": .number(.one), "2": .number(.two), "3": .number(.three),
        "4": .number(.four), "5": .number(.five), "6": .number(.six),
        "7": .number(.seven), "8": .number(.eight), "9": .number(.nine),
        "0": .number(.zero), ".": .symbol(.dot),
        "+": .symbol(.plus), "-": .symbol(.minus), "×": .symbol(.multiply),
        "÷": .symbol(.divide), "=": .symbol(.equal), "%": .symbol(.percent),
        "±": .symbol(.negate), "C": .symbol(.clear), "AC": .symbol(.allClear)
    ]
}

extension Buttons {
    //버튼에게 전달받은 타이틀을 열거형 케이스로 전환
    static func getButtonCase(title: String) -> Buttons? {
        return Buttons.buttonMap[title]
    }
    //버튼에 쓸 타이틀 전달 메서드
    static func getButtonTitles() -> [[String]]{
        let rows: [[Buttons]] = [
            [.symbol(.clear), .symbol(.negate), .symbol(.percent), .symbol(.divide)],
            [.number(.one), .number(.two), .number(.three), .symbol(.plus)],
            [.number(.four), .number(.five), .number(.six), .symbol(.minus)],
            [.number(.seven), .number(.eight), .number(.nine), .symbol(.multiply)],
            [.number(.zero), .symbol(.dot), .symbol(.equal)]
        ]
        return rows.map { row in
            row.map { $0.buttonTitle }
        }
    }
}
