//
//  DisplayLabel.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/21/24.
//
import UIKit

class DisplayLabel: UILabel {
    init() {
        super.init(frame: .zero)
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLabel(){
        text = "0"
        textAlignment = .right
        font = UIFont.systemFont(ofSize: 60, weight: .bold)
        textColor = .white.withAlphaComponent(0.9)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension DisplayLabel {
    func updateDisplayNum(newNum: String) {
        self.text = formatNum(num: newNum)
    }
    
    private func formatNum(num: String) -> String {
        let splitNum = num.split(separator: ".")
        let isNegative: Bool = num.contains("-")//음수 처리를 위한 체크
        var intPart: Substring.SubSequence = splitNum[0]
        let decimalPart: Substring.SubSequence? = (splitNum.count > 1 ? splitNum[1] : nil)//정수와 소수부분 체크
        var commaFormatString: String = ""
        var commaCount: Int = 0
        
        if isNegative {//음수라면 - 제거
            intPart.removeFirst()
        }
        
        for num in intPart.reversed() {
            if commaCount == 3 {
                commaFormatString.append(",")
                commaCount = 0
            }
            commaFormatString.append(num)
            commaCount += 1
        }
        
        if let decimalPart = decimalPart {
            commaFormatString = String(commaFormatString.reversed() + "." + String(decimalPart))
        } else {
            commaFormatString = String(commaFormatString.reversed())
        }
        
        if isNegative {
            commaFormatString = "-" + commaFormatString
        }
        
        return commaFormatString
    }
}
