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
    
    enum Numbers {
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case zero
        case dot
    }
    
    enum Symbols {
        case plus
        case minus
        case multiply
        case divide
        case equal
        case percent
        case negate
        case clear
        case allClear
    }
    
    var buttonTitle: String {
        switch self {
        case .number(let number):
            switch number {
            case .one:
                return "1"
            case .two:
                return "2"
            case .three:
                return "3"
            case .four:
                return "4"
            case .five:
                return "5"
            case .six:
                return "6"
            case .seven:
                return "7"
            case .eight:
                return "8"
            case .nine:
                return "9"
            case .zero:
                return "0"
            case .dot:
                return "."
            }
        case .symbol(let symbol):
            switch symbol {
            case .plus:
                return "+"
            case .minus:
                return "-"
            case .multiply:
                return "×"
            case .divide:
                return "÷"
            case .equal:
                return "="
            case .percent:
                return "%"
            case .negate:
                return "±"
            case .clear:
                return "C"
            case .allClear:
                return "AC"
            }
        }
    }
}

extension Buttons {
    static func getButtonCase(title: String) -> Buttons? {
        switch title {
        case "1":
            return .number(.one)
        case "2":
            return .number(.two)
        case "3":
            return .number(.three)
        case "4":
            return .number(.four)
        case "5":
            return .number(.five)
        case "6":
            return .number(.six)
        case "7":
            return .number(.seven)
        case "8":
            return .number(.eight)
        case "9":
            return .number(.nine)
        case "0":
            return .number(.zero)
        case ".":
            return .number(.dot)
        case "+":
            return .symbol(.plus)
        case "-":
            return .symbol(.minus)
        case "×":
            return .symbol(.multiply)
        case "÷":
            return .symbol(.divide)
        case "=":
            return .symbol(.equal)
        case "%":
            return .symbol(.percent)
        case "±":
            return .symbol(.negate)
        case "C":
            return .symbol(.clear)
        case "AC":
            return .symbol(.allClear)
        default:
            return nil
        }
    }
    
    static func getButtonTitles() -> [[String]]{
        let rows: [[Buttons]] = [
            [.symbol(.clear), .symbol(.negate), .symbol(.percent), .symbol(.divide)],
            [.number(.one), .number(.two), .number(.three), .symbol(.plus)],
            [.number(.four), .number(.five), .number(.six), .symbol(.minus)],
            [.number(.seven), .number(.eight), .number(.nine), .symbol(.multiply)],
            [.number(.zero), .number(.dot), .symbol(.equal)]
        ]
        return rows.map { row in
            row.map { $0.buttonTitle }
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .number(let number):
            hasher.combine(0)
            hasher.combine(number)
        case .symbol(let symbol):
            hasher.combine(0)
            hasher.combine(symbol)
        }
    }
    
    static func == (lhs: Buttons, rhs: Buttons) -> Bool {
        switch (lhs, rhs) {
        case (.number(.one), .number(.one)):
            return true
        case (.number(.two), .number(.two)):
            return true
        case (.number(.three), .number(.three)):
            return true
        case (.number(.four), .number(.four)):
            return true
        case (.number(.five), .number(.five)):
            return true
        case (.number(.six), .number(.six)):
            return true
        case (.number(.seven), .number(.seven)):
            return true
        case (.number(.eight), .number(.eight)):
            return true
        case (.number(.nine), .number(.nine)):
            return true
        case (.number(.zero), .number(.zero)):
            return true
        case (.number(.dot), .number(.dot)):
            return true
        case (.symbol(.plus),.symbol(.plus)):
            return true
        case (.symbol(.minus),.symbol(.minus)):
            return true
        case (.symbol(.multiply),.symbol(.multiply)):
            return true
        case (.symbol(.divide),.symbol(.divide)):
            return true
        case (.symbol(.equal),.symbol(.equal)):
            return true
        case (.symbol(.percent),.symbol(.percent)):
            return true
        case (.symbol(.negate),.symbol(.negate)):
            return true
        case (.symbol(.clear),.symbol(.clear)):
            return true
        case (.symbol(.allClear), .symbol(.allClear)):
            return true
        default:
            return false
        }
    }
}
