//
//  MainStack.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
import UIKit

class MainStack: UIStackView {
    private let buttonTitles: [[String]] = Buttons.getButtonTitles()
    private(set) var rows: [RowStack] = []
    init() {
        super.init(frame: .zero)
        setStack()
        setButtonRow(buttonsArr: buttonTitles)
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
            let buttonRow = RowStack(buttonTitles: buttons)
            rows.append(buttonRow)
            addArrangedSubview(buttonRow)
        }
    }
    
}
