//
//  RowStack.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
import UIKit

class RowStack: UIStackView {
    init(buttonTitle: [String]) {
        super.init(frame: .zero)
        setButton(titles: buttonTitle)
        setStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButton(titles: [String]) {
        for title in titles {
            let button = CircleButton(title: title, alpha: 0.3)
            addArrangedSubview(button)
        }
    }
    
    private func setStack() {
        axis = .horizontal
        alignment = .fill
        distribution = .fillEqually
        spacing = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
