//
//  RowButtonStack.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/24/24.
//
import UIKit

class RowStack: UIStackView {
    private(set) var buttons: [UIButton] = []//상위 계층에서 편하게 접근하기 위한 배열
    let spacingSize: CGFloat = 10
    let buttonAlpha: CGFloat = 0.3
    
    init(buttonTitles: [String]) {
        super.init(frame: .zero)
        setStack()
        setButtons(titles: buttonTitles)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButtons(titles: [String]) {
        for title in titles {
            let button = CircleButton(title: title, alpha: buttonAlpha)
            buttons.append(button)
            addArrangedSubview(button)
        }
        
        if titles.count == 3 {
            self.setThreeButtonsLayout(buttons: self.buttons)
        }
    }
    
    private func setThreeButtonsLayout(buttons: [UIButton]) {
        NSLayoutConstraint.activate(
            buttons.enumerated().map { index, button in
                button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: index == 0 ? 0.5 : 0.25, constant: (-1 * spacingSize * (index == 0 ? 0.5 : 0.75))
                )
            }
        )
    }
    
    private func setStack() {
        axis = .horizontal
        alignment = .fill
        distribution = .fillEqually
        spacing = spacingSize
        translatesAutoresizingMaskIntoConstraints = false
    }
}
