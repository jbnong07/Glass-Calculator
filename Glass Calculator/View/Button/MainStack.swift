//
//  MainStack.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
import UIKit

class MainStack: UIStackView {
    private let buttonsArr: [[String]] = [
        ["C", "±", "%", "÷"],
        ["1", "2", "3", "+"],
        ["4", "5", "6", "-"],
        ["7", "8", "9", "×"],
    ]
    private let zeroRowButtons: [String] = ["0", ".", "="]
    private(set) var rows: [ButtonStackProtocol] = []
    
    init() {
        super.init(frame: .zero)
        setStack()
        setButtonRow(buttonsArr: buttonsArr)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStack(){
        axis = .vertical
        spacing = 10
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setButtonRow(buttonsArr: [[String]]){
        for buttons in buttonsArr {
            let buttonRow = RowStack(buttonTitle: buttons)
            rows.append(buttonRow)
            addArrangedSubview(buttonRow)
        }
        let zeroRow = ZeroRowStack(titles: zeroRowButtons)
        rows.append(zeroRow)
        addArrangedSubview(zeroRow)
    }
    
}
