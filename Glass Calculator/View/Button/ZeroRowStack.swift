//
//  ZeroButtonRow.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
import UIKit

class ZeroRowStack: UIStackView {
    let spacingSize: CGFloat = 10
    
    init(titles: [String]) {
        super.init(frame: .zero)
        setStack()
        setButtons(titles: titles)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStack(){
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = spacingSize
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setButtons(titles: [String]) {
        let buttonAlpha: CGFloat = 0.3
        
        // 0 버튼 (두 칸 차지)
        let zeroButton = CircleButton(title: titles[0], alpha: buttonAlpha)
        let equalButton = CircleButton(title: titles[2], alpha: buttonAlpha)
        let dotButton = CircleButton(title: titles[1], alpha: buttonAlpha)
        addArrangedSubview(zeroButton)
        addArrangedSubview(equalButton)
        addArrangedSubview(dotButton)
        
        NSLayoutConstraint.activate([
            zeroButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5, constant: (-1 * spacingSize / 2)),
            equalButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25, constant: (-1 * spacingSize * 3 / 4)),
            dotButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25, constant: (-1 * spacingSize * 3 / 4)),
        ])
    }
}
